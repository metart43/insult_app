class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user_groups
  helper_method :current_user_insults
  helper_method :logged_in?

  def current_user
    User.find_by(id: session["user_id"])
  end

  def current_user_groups
    current_user.groups
  end

  def current_user_insults
    current_user_groups.map(&:insults).flatten
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash["notice"] = "Must be logged in"
    redirect_to login_path unless logged_in?
  end

  def search_results
    @query = params[:q]
    @users = User.search(@query)
    @groups = Group.search(@query)
  end

end
