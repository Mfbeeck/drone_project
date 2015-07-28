class AttachmentsController < ApplicationController
	before_action :require_user, only: [:edit, :create, :update, :destroy]

	include AttachmentsHelper

	def index
		@attachments = Attachment.all
	end
	def create
		@attachment = Attachment.new(attachment_params)
		@attachment.gallery_id = params[:gallery_id]

		@attachment.save

		redirect_to gallery_path(@attachment.gallery)	
	end

	def show
		@attachment = Attachment.find(params[:id])
		@gallery = Gallery.find(params[:gallery_id])
	end

	def edit
		@attachment = Attachment.find(params[:id])
		@gallery = Gallery.find(params[:gallery_id])
	end

	def update
		@attachment = Attachment.find(params[:id])
  		@attachment.update(attachment_params)
  		@gallery = Gallery.find(params[:gallery_id])
		redirect_to gallery_path(@gallery)
		flash.notice = "The attachment \"#{@attachment.title}\" was successfully updated."

	end

	def destroy
		@attachment = Attachment.find(params[:id])
		@attachment.destroy
  		@gallery = Gallery.find(params[:gallery_id])
		redirect_to gallery_path(@gallery)
		flash.notice = "The attachment \"#{@attachment.title}\" was successfully deleted."
	end

end
