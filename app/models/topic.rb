class Topic < ActiveRecord::Base
	belongs_to :forum
	#has_many :microposts, dependent: :destroy
	validates :problem, presence: true
	validates :description, presence: true
end
