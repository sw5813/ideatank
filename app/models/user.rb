class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy

	attr_accessor :first_name, :last_name
	before_validation { self.name = "#{self.first_name} #{self.last_name}" }
	before_save { email.downcase! }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50, minimum: 2 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed 
		#prelim until ch. 11
		Micropost.where("user_id = ?", id)
	end

	def send_password_reset
		create_password_reset_token
		self.password_reset_sent_at = Time.zone.now
		save!(validate: false)
		UserMailer.password_reset(self).deliver
	end

	def valid_attribute?(attr, value)
	  u = User.new(attr => value)
	  u.valid?
	  if(u.errors.to_hash.has_key?(attr))
	    false
	  else
	    true
	  end
	end
=begin
	def first_name
		name.split(/\s/).first
	end

	def last_name
		name.split(/\s/).last
	end		
=end
	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		def create_password_reset_token
			self.password_reset_token = User.encrypt(User.new_remember_token)
		end
end
