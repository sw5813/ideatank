class Message < ActiveRecord::Base
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50, minimum: 2 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :subject, presence: true
	validates :message, presence: true
end
