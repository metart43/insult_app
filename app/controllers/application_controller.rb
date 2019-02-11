class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if @user
      return @user
    else
      @user = User.find_by(id: session["user_id"])
    end
  end

end
