class InsultsController < ApplicationController
  before_action :authorized
  before_action :find_insult, only: [:show]

  def show
  end

  def new
    @insult = Insult.new
    @group = Group.find(params[:group_id])
    @users = @group.users.where.not(id: current_user.id)
  end

  def create
    @insult = Insult.new(insult_params)
    if @insult.save
      params[:insult][:victim_ids].reject(&:empty?).each do |v|
        @insult.victims << User.find(v)
      end
      redirect_to @insult
    else
      @group = Group.find(@insult.group_id)
      @users = @group.users.where.not(id: current_user.id)
      render :new
    end
  end


  def destroy
    Insult.destroy(params[:id])
    redirect_to home_path
  end

  private

def find_insult
  @insult = Insult.find(params[:id])
end

def insult_params
  parameters = params.require(:insult).permit(:content, :group_id).to_h
  parameters[:bully] = current_user
  parameters
end

end
