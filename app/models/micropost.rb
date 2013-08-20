class Micropost < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user
	
	#default_scope -> { order('created_at DESC') }
	
	validates :summary, presence: true 
	validates :content, presence: true, length: { maximum: 500 }
	validates :user_id, presence: true
	validates :topic_id, presence: true
	
	scope :approved, ->(){where(approved: true)}
	scope :pending, ->(){where(approved: false)}
end
