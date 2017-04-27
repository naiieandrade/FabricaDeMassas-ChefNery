#GRASP pattern: Low coupling does not have any dependency with other classes

class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	has_many :orders

	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	has_many :reviews, dependent: :destroy
end
