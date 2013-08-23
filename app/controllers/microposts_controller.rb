class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@micropost = Micropost.new(content: params[:micropost][:content], summary: params[:micropost][:summary], topic_id: params[:micropost][:topic_id], user_id: current_user.id)
		@topic = Topic.find(@micropost.topic_id)
		if @micropost.save
			flash[:success] = "Your solution has been submitted for consideration!"
			redirect_to :back
		else
			render "topics/show", location: topic_path(@topic)
		end
	end

	def destroy
		@micropost.destroy
		flash[:error] = "Post deleted."
		redirect_to "/topics/#{@micropost.topic_id}"
	end

	def approve_post
		@micropost = Micropost.find(params[:id])
		@micropost.update_attribute(:approved, true)
		flash[:success] = "Post approved."
		redirect_to "/topics/#{@micropost.topic_id}"
	end


	private

		def micropost_params
			params.require(:micropost).permit(:summary, :content, :user_id)
		end

		def correct_user
			if current_user.mod?
				@micropost = Micropost.find(params[:id])
			else
				@micropost = current_user.microposts.find_by(id: params[:id])
			end
			redirect_to root_url if @micropost.nil? 
		end
end