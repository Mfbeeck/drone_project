class Attachment < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "100x100>" }, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def s3_credentials
    {:bucket => S3_BUCKET_NAME, :access_key_id => AWS_ACCESS_KEY_ID, :secret_access_key => AWS_SECRET_ACCESS_KEY}
  end
end
