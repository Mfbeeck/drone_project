class GalleriesController < ApplicationController
	before_action :require_user, only: [:edit, :new, :create, :update, :destroy]

	include GalleriesHelper
	def index
		@galleries = Gallery.all
	end
	def show
		@gallery = Gallery.find(params[:id])
		@attachment = Attachment.new
		@attachment.gallery_id = @gallery.id

	end
	def edit
		@gallery = Gallery.find(params[:id])
	end
	def new
		@gallery = Gallery.new
	end
	def create
		@gallery = Gallery.new(gallery_params)
		@gallery.save
		redirect_to gallery_path(@gallery)
		flash.notice = "The gallery \"#{@gallery.title}\" was successfully created."
	end

	def update
		@gallery = Gallery.find(params[:id])
		@gallery.update(gallery_params)
		redirect_to gallery_path(@gallery)
		flash.notice = "The gallery \"#{@gallery.title}\" was successfully updated."
	end

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		redirect_to galleries_path
		flash.notice = "The gallery \"#{@gallery.title}\" was successfully deleted."
	end
  	

end
