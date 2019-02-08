class InsultsController < ApplicationController
  before_action :find_insult, only: [:show, :destroy]
  def show
  end
  def new
    @insult = Insult.new
  end
  def create
    @insult = Insult.create(insult_params)
    @users = User.all
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
  params.require(:insult).permit(:content, :bully)
end
end
