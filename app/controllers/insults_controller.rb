class InsultsController < ApplicationController
  before_action :find_insult, only: [:show, :destroy]
  def show
  end

  def new
    @insult = Insult.new
    @users = User.where.not(id: current_user.id)
    @group = Group.find(params[:group_id])
  end

  def create
    @insult = Insult.create(insult_params)
    # associate_victims(params[:insult][:victim_ids], @insult)
    params[:insult][:victim_ids].reject(&:empty?).each do |v|
      @insult.victims << User.find(v)
    end
    redirect_to @insult
  end

  def destroy
    @insult.destroy
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
