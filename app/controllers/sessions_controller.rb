class SessionsController < ApplicationController

  def new
    render :layout => false
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash["notice"] = "No user found with that name/password."
      render :new
    end
  end

  def destroy
    render :layout => false
    session.clear
    redirect_to login_path
  end

end
