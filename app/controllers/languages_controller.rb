class LanguagesController < ApplicationController
  def index
    @languages = Language.order('designation ASC').where(nil)
  end
  
  def new
    @language = Language.new
    render 'edit'
  end

  def create
    @language = Language.new()
    if @language.save
      @language.update_attributes(language_params)
      flash[:language_id] = @language.id
      redirect_to controller: 'languages', action: 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    Language.find(params[:id]).destroy
    flash[:success] = 'language deleted'
    redirect_to controller: 'languages', action: 'index'
  end


  def edit
    unless logged_in?
      redirect_to controller: 'texts', action: 'index'
    end
    @language = Language.find(params[:id])
  end

  def show
    @language = Language.find(params[:id])
  end

  def show_json
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    @language.update_attributes(language_params)
    redirect_to action: :show, id: @language.id
  end

  def language_params
    params.require(:language).permit(:designation, :location, :iso, :status, {:alternate_designation_ids => []}, {:orthography_ids => []}, :macro_classification, :glottocode, :latitude, :longitude)
  end
end
