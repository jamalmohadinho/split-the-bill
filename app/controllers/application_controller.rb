class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to do that."
    end
  end
end
