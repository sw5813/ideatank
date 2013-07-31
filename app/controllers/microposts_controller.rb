class MicropostsController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy

	def create
		@topic = Topic.find(params[:id])
		@micropost = topic.microposts.build(micropost_params)
		@micropost.user_id = current_user.id
		if @micropost.save
			flash[:success] = "Your solution has been posted!"
			redirect_to topic_microposts_path(@topic)
		else
			redirect_to topic_microposts_path(@topic)
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private

		def micropost_params
			params.require(:micropost).permit(:summary, :content, :user_id)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end