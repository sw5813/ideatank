class ForumsController < ApplicationController
	def show
		@forum = Forum.find(params[:id])
		@topics = @forum.topics(params[:id])
	end

	def index
		@forums = Forum.all
	end
end
