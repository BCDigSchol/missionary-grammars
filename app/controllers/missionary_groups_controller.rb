class MissionaryGroupsController < ApplicationController
  before_action :require_login

  def new
    @group = MissionaryGroup.new
    render 'edit'
  end

  def create
    @missionary_group = MissionaryGroup.new()
    if @missionary_group.save
      @missionary_group.update_attributes(group_params)
      flash[:orgthography_id] = @missionary_group.id
      redirect_to controller: 'missionary_groups', action: 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    MissionaryGroup.find(params[:id]).destroy
    flash[:success] = 'Group deleted'
    redirect_to controller: 'missionary_groups', action: 'index'
  end

  def index
    @groups = MissionaryGroup.order('name ASC').where(nil)
  end

  def edit
    @group = MissionaryGroup.find(params[:id])
  end

  def update
    @group = MissionaryGroup.find(params[:id])
    @group.update_attributes(group_params)
    redirect_to action: :index
  end

  def group_params
    params.require(:missionary_group).permit(:name)
  end
  
end
