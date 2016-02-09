class OrthographiesController < ApplicationController

  before_action :require_login

  def index
    @orthographies = Orthography.order('name ASC').where(nil)
  end

  def new
    @orthography = Orthography.new
    render 'edit'
  end

  def create
    @orthography = Orthography.new()
    if @orthography.save
      @orthography.update_attributes(orthography_params)
      flash[:orgthography_id] = @orthography.id
      redirect_to controller: 'orthographies', action: 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    Orthography.find(params[:id]).destroy
    flash[:success] = 'Orthography deleted'
    redirect_to controller: 'orthographies', action: 'index'
  end

  def edit
    @orthography = Orthography.find(params[:id])
  end

  def update
    @orthography = Orthography.find(params[:id])
    @orthography.update_attributes(orthography_params)
    redirect_to action: :index
  end

  def orthography_params
    params.require(:orthography).permit(:name)
  end

  def require_login
    unless logged_in?
      redirect_to controller: 'texts', action: 'index'
    end
  end

end
