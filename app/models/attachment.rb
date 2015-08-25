class Attachment < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
