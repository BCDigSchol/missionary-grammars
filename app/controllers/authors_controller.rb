class AuthorsController < ApplicationController
  before_action :require_login

  def index
    @authors = Author.order('last ASC').where(nil)
  end

  def new
    @author = Author.new
    render 'edit'
  end

  def create
    @author = Author.new()
    if @author.save
      @author.update_attributes(author_params)
      flash[:author_id] = @author.id
      redirect_to controller: 'authors', action: 'editlist'
    else
      render :action => 'new'
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:success] = 'author deleted'
    redirect_to controller: 'authors', action: 'index'
  end

  def show
    @author = Author.find(params[:id])
  end

  def typeahead
    @authors = Author.where('upper(last) like ?', '#{params[:q]}%'.upcase)
    render json: @authors
  end

  def edit
    @author = Author.find(params[:id])
  end

  def editlist
    @authors = Author.order('last ASC').where(nil)
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    redirect_to action: :show, id: @author.id
  end

  def author_params
    params.require(:author).permit(:last, :first)
  end
end
