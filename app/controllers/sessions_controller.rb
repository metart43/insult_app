class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash["notice"] = "No user found with that name."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
  
end
