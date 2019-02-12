class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]

  def search_results
    @query = params[:q]
    @users = User.search(@query)
  end

  def show
  end

  def new
    render :layout => false
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save && params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif !user.save
      flash["notice"] = "That username is already taken."
      render :new
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash["notice"] = "Passwords must match."
      render :new
    end
  end

  def home
    @user = current_user
    @groups = @user.groups
    @insults = @groups.map(&:insults).flatten
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to '/login'
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
