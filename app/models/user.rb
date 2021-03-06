class User < ActiveRecord::Base
	  has_secure_password
	  validates :first_name, :last_name, :email, presence: { error: "Missing info! Please fill out." }
	  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	  validates :email, uniqueness: true
  	  validates_length_of :password, minimum: 7

end

