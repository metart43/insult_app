class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session["user_id"])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash["notice"] = "Must be logged in"
    redirect_to login_path unless logged_in?
  end

end
