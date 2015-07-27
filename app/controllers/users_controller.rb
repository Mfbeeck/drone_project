class UsersController < ApplicationController
	before_action :require_user, only: [:index]
	before_action :require_admin, only: [:new, :show, :edit, :update, :create, :destroy]

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to users_path
		flash.notice = "The user \"#{@user.email}\" was successfully updated."
	end

	def create 
		@user = User.new(user_params) 
		if !current_user.admin
			if @user.save 
				session[:user_id] = @user.id 
				redirect_to '/galleries' 
			else 
				redirect_to '/signup' 
			end 
		else
			if @user.save 
				redirect_to '/users' 
			else 
				redirect_to '/signup' 
			end 
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
		flash.notice = "The user \"#{@user.email}\" was successfully deleted."
	end

	private
  	def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
  	end


end
