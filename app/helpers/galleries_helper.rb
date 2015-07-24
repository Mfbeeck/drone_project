module GalleriesHelper
	def gallery_params
  		params.require(:gallery).permit(:title, :body, :created_at, :updated_at)
	end
end
