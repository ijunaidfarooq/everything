class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def current_user
  	@user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	current_user!= nil
  end

  def require_user
  	if current_user
  		true
  	else
  		redirect_to root_url , :notice => "You need to login for this first"
  	end
  end
end
