class Topic < ActiveRecord::Base
	belongs_to :forum
	has_many :microposts, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates :problem, presence: true
	validates :description, presence: true
	validates :forum_id, presence: true
end
