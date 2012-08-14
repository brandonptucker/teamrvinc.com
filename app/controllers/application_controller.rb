class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    unless signed_in?
      redirect_to signin_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :logged_in?, :current_user
end
