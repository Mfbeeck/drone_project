module AttachmentsHelper
	def attachment_params
		params.require(:attachment).permit(:about, :title, :location, :image, :url, :image_file_name, :image_content_type, :image_file_size, :image_updated_at)
	end

end
