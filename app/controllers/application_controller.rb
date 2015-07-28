class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user 

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #WHY DOES THIS BREAK IF I DELETE USERS
  end

  def require_user 
    if !current_user
  	  redirect_to '/login'
      flash.notice = "You are not a user. You must login to access this feature."
    else
    end
  end

  def require_admin
      if current_user.nil? || !current_user.admin
        redirect_to '/login'
        flash.notice = "You are not the admin. Please login."
      else
      end
  end
end