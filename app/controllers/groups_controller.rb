class GroupsController < ApplicationController
  before_action :authorized

  def search_results
    @query = params[:q]
    @groups = Group.search(params[:q])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
      if @group.save
        @group.users << current_user
        redirect_to @group
      else
        render :new
      end
  end

  def show
    @group = Group.find(params[:id])
    @insults = @group.insults
  end

  def leave
    @group = Group.find(params[:id])
    @group.users.delete(current_user.id)
    redirect_to @group
  end

  def join
    @group = Group.find(params[:id])
    @group.users << current_user
    redirect_to @group
  end

  def add
    user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    group.users << user
    redirect_to group
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
