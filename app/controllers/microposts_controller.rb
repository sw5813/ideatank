class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@micropost = Micropost.new(content: params[:micropost][:content], summary: params[:micropost][:summary], topic_id: params[:micropost][:topic_id], user_id: current_user.id)
		if @micropost.save
			flash[:success] = "Your solution has been posted!"
			redirect_to "/topics/#{@micropost.topic_id}"
		else
			redirect_to "/topics/#{@micropost.topic_id}"
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