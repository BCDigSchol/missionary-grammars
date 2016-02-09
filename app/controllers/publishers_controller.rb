class PublishersController < ApplicationController

  before_action :require_login

  def new
    @publisher = Publisher.new
    render "edit"
  end

  def create
    @publisher = Publisher.new()
    if @publisher.save
      @publisher.update_attributes(publisher_params)
      flash[:orgthography_id] = @publisher.id
      redirect_to controller: "publishers", action: 'index'
    else
      render :action => "new"
    end
  end

  def destroy
    Publisher.find(params[:id]).destroy
    flash[:success] = "Publisher deleted"
    redirect_to controller: "publishers", action: 'index'
  end

  def index
      @publishers = Publisher.order('name ASC').where(nil)
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    @publisher.update_attributes(publisher_params)
    redirect_to action: :index
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

  def require_login
    unless logged_in?
      redirect_to controller: "texts", action: 'index'
    end
  end
end
