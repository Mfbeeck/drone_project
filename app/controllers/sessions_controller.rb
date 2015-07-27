class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to '/galleries'
		else
			redirect_to '/login'
			flash.notice = "Your login info was not correct. Try again!"
		end 
	end

	def destroy 
		session[:user_id] = nil 
		redirect_to '/galleries' 
	end
end
