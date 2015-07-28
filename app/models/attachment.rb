class Attachment < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
