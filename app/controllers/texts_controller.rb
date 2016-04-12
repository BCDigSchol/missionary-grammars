require 'set'

class TextsController < ApplicationController
  layout 'read', only: [:show, :search]

  def index
    @page = 'texts'
    @texts = build_text_results
  end

  def new
    @text = Text.new
    @flags = @text.attributes.keys.sort
    render 'edit'
  end

  def create
    @text = Text.new()
    if @text.save
      @text.update_attributes(text_params)
      flash[:text_id] = @text.id
      redirect_to controller: 'texts', action: 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    Text.find(params[:id]).destroy
    flash[:success] = 'text deleted'
    redirect_to controller: 'texts', action: 'index'
  end

  def edit
    @text = Text.find(params[:id])
    @flags = @text.attributes.keys.sort
  end

  def show
    @text = Text.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json { self.structure }
    end

  end

  def show_json
    @text = Text.find(params[:id])
    render :json => @text,
           :include => {:missionary_group => {:only => [:name, :id]},
                        :text_category => {:only => [:name, :id]},
                        :publishers => {:only => [:name, :id]},
                        :authors => {
                            :only => [:last, :first]
                        },
                        :languages => {:only => [:designation, :id]}
           },
           :except => [:digital_copy_url, :missionary_group_id, :google_url, :hathi_url, :created_at, :updated_at, :holding_library, :holding_details]
  end

  def read
    @text = Text.find(params[:id])
    @text_json = {:title => @text.title, :authors => @text.authors}.to_json.html_safe
  end

  def structure
    @text = Text.find(params[:id])

    languages = []
    @text.languages.each do |lang|
      languages.push({
                         :id => lang.id,
                         :glottocode => lang.glottocode,
                         :iso => lang.iso,
                         :designation => lang.designation,
                         :alternate_designations => lang.alternate_designations,
                         :macro_classification => lang.macro_classification,
                         :orthography => lang.orthography,
                         :status => lang.status,
                         :latitude => lang.latitude,
                         :longitude => lang.longitude,
                         :location => lang.location
                     })
    end

    render json: {
        :title => @text.title,
        :category => @text.text_category,
        :authors => @text.authors,
        :year => @text.publication_year,
        :place => @text.publication_place,
        :publisher => @text.publishers,
        :languages => languages,
        :first_page => @text.cover_image.to_i,
        :pages => @text.pages - 1,
        :flags => {
            :by_same_author => @text.by_same_author_flag,
            :preface => @text.preface_flag,
            :foreward => @text.foreward_flag,
            :table_of_prefixes => @text.table_of_prefixes_flag,
            :introduction => @text.introduction_flag,
            :alphabet => @text.alphabet_flag,
            :orthography => @text.orthography_flag,
            :notize => @text.notize_flag,
            :prounciation => @text.prounciation_flag,
            :orthography_and_pronunciation => @text.orthography_and_pronunciation_flag,
            :observations => @text.observations_flag,
            :grammatical_sketch => @text.grammatical_sketch_flag,
            :grammar_summary => @text.grammar_summary_flag,
            :rules_of_language => @text.rules_of_language_flag,
            :phrase_collection => @text.phrase_collection_flag,
            :signs_and_abbreviations => @text.signs_and_abbreviations_flag,
            :abbreviations => @text.abbreviations_flag,
            :sodality => @text.sodality_flag,
            :bulletin => @text.bulletin_flag,
            :proper_names => @text.proper_names_flag,
            :appendix => @text.appendix_flag,
            :addenda => @text.addenda_flag,
            :contents => @text.contents_flag
        },
        :structure => @text.structure
    }
  end

  def update
    @text = Text.find(params[:id])
    @text.update_attributes(text_params)
    redirect_to action: :show, id: @text.id
  end

  def search

    es = SearchIndex.new
    es.search_texts params['title'], params['author'], params['language'], params['publisher'], params['group'], params['date'], params['category'], params['alternate_designations']
    response = {
        :language => es.languages,
        :alternate_designations => es.alternate_designations,
        :title => es.titles,
        :author => es.authors,
        :publisher => es.publishers,
        :date => es.dates,
        :category => es.categories,
        :hits => es.hits
    }
    respond_to do |format|
      format.html {}
      format.json { render json: response }
    end
  end

  private

  def build_select_list(base_class, order_sql, value_field, param_symbol)
    response = []
    response = base_class.order(order_sql).all.map { |item| {label: item.send(value_field), value: item.id} }
    return response
  end

  def build_text_results
    texts = Text.order('title ASC').where(nil)
    texts = texts.title(params[:title]) if params[:title].present?
    texts = texts.author_id(params[:authors]) if params[:authors].present?
    texts = texts.missionary_group(params[:groups]) if params[:groups].present?
    return texts
  end

  def build_api_result(text)
    result = {}
    result['title'] = text.title
    result['id'] = text.id
    result['authors'] = text.authors.select('id')
    result['publishers'] = text.publishers.select('id')
    result['groups'] = text.missionary_group
    return result
  end

  def extract_field(result)

  end

  def text_params
    params.require(:text).permit(:title, {:author_ids => []}, {:language_ids => []}, {:publisher_ids => []}, :text_category_id, :missionary_group_id, :publication_year, :edition_node, :publication_place, :publisher, :holding_library, :holding_details, :digital_copy_url, :hathi_url, :google_url, :text_categories, :by_same_author_flag, :preface_flag, :foreward_flag, :table_of_prefixes_flag, :introduction_flag, :alphabet_flag, :orthography_flag, :notize_flag, :prounciation_flag, :orthography_and_pronunciation_flag, :observations_flag, :grammatical_sketch_flag, :grammar_summary_flag, :rules_of_language_flag, :phrase_collection_flag, :signs_and_abbreviations_flag, :abbreviations_flag, :sodality_flag, :bulletin_flag, :proper_names_flag, :appendix_flag, :addenda_flag, :contents_flag,)
  end

end