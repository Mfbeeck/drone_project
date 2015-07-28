class UsersController < ApplicationController
	before_action :require_user, only: [:index]
	before_action :require_admin, only: [:show, :edit, :update, :destroy]

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
			if @user.save 
				if !current_user.admin

				session[:user_id] = @user.id 
				redirect_to '/galleries' 
				else 
				redirect_to '/users' 
				end 
			else			
				flash.notice = @user.errors.messages
				redirect_to :back
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
