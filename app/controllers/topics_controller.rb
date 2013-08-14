class TopicsController < ApplicationController
	def show
		@topic = Topic.find(params[:id])
		@microposts_approved = @topic.microposts.approved.paginate(page: params[:page])
		@microposts_pending = @topic.microposts.pending.paginate(page: params[:page])
		@micropost = @topic.microposts.build if signed_in?
	end
end
