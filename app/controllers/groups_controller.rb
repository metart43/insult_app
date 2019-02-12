class GroupsController < ApplicationController
  def search_results
    @query = params[:q]
    @groups = Group.search(params[:q])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to @group
  end

  def show
    @group = Group.find(params[:id])
  end


  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
