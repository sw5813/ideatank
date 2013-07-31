class TopicsController < ApplicationController
	def show
		@topic = Topic.find(params[:id])
		@microposts = @topic.microposts.paginate(page: params[:page])
		@micropost = @topic.microposts.build if signed_in?
	end
end
