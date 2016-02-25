require 'set'

class TextsController < ApplicationController
  layout "read", only: [:read]

  def index
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
  end

  def read
    @text = Text.find(params[:id])
    @text_json = {:title => @text.title, :authors => @text.authors}.to_json.html_safe
  end

  def structure
    render :file => "#{Rails.root}/app/assets/Json/#{params[:id]}.json",
           :content_type => 'application/json',
           :layout => false
  end

  def update
    @text = Text.find(params[:id])
    @text.update_attributes(text_params)
    redirect_to action: :show, id: @text.id
  end

  def search
    @authors = build_select_list(Author, 'authors.last ASC, authors.first ASC', :full_name, :author)
    @groups = build_select_list(MissionaryGroup, 'name ASC', :name, :group)
    @publishers = build_select_list(Publisher, 'name ASC', :name, :publisher)
    @languages = build_select_list(Language, 'designation ASC', :designation, :language)

    respond_to do |format|
      format.html
      format.json {

        results = build_text_results.map { |text| build_api_result(text) }
        authors = Set.new

        response = {
            results: results,
            fields: [
                {
                    display: 'Authors',
                    name: 'authors',
                    options: @authors
                },
                {
                    display: 'Groups',
                    name: 'groups',
                    options: @groups
                },
                {
                    display: 'Publisher',
                    name: 'publishers',
                    options: @publishers
                },
                {
                    display: 'Languages',
                    name: 'languages',
                    options: @languages
                }
            ]
        }
        render json: response
      }
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