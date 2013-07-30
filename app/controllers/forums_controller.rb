class ForumsController < ApplicationController
	def show
		@forum = Forum.find(params[:id])
		#all topics
	end

	def index
		@forums = Forum.all
	end
end
