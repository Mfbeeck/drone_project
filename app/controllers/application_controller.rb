class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user 

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #WHY DOES THIS BREAK IF I DELETE USERS
  end

  def require_user 
  	redirect_to '/login' unless current_user 
	flash.notice = "You are not a user. You must login to access this feature."

  end

  def require_admin
	redirect_to '/login' unless current_user.admin
	flash.notice = "You are not the admin. Stay out!"

  end


end
