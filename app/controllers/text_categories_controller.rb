class TextCategoriesController < ApplicationController
  before_action :require_login
  
  def new
    @text_category = TextCategory.new
    render 'edit'
  end

  def create
    @text_category = TextCategory.new()
    if @text_category.save
      @text_category.update_attributes(text_category_params)
      flash[:orgthography_id] = @text_category.id
      redirect_to controller: 'text_categories', action: 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    TextCategory.find(params[:id]).destroy
    flash[:success] = 'TextCategory deleted'
    redirect_to controller: 'text_categories', action: 'index'
  end
  
  def index
    @categories = TextCategory.order('name ASC').where(nil)
  end

  def edit
    @text_category = TextCategory.find(params[:id])
  end

  def update
    @category = TextCategory.find(params[:id])
    @category.update_attributes(text_category_params)
    redirect_to action: :index
  end

  def text_category_params
    params.require(:text_category).permit(:name)
  end
end
