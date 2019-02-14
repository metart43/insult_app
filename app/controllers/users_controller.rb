class UsersController < ApplicationController
  before_action :authorized, except: [:new, :create]
  before_action :get_user, only: [:show, :edit, :update]
  layout :resolve_layout

  def search_results
    @query = params[:q]
    @users = User.search(@query)
  end

  def show
    @insults = @user.all_insults
    @allgroups = Group.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    elsif !@user.save
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

  def resolve_layout
    case action_name
    when "new", "create"
      false
    else
      "application"
    end
  end

end
