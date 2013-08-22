class MessagesController < ApplicationController
	# POST /messages
  	# POST /messages.json
	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		respond_to do |format|
			if @message.save
				ContactMailer.contact_message(@message).deliver

				format.html { redirect_to(contact_path, notice: 'Your message has been sent!') }
				format.json { render json: @message, status: :created, location: @message }
			else
				format.html { render action: 'new' }
				format.json { render json: @message.errors, status: :unprocessable_entity }
			end
		end
	end

	private

		def message_params
			params.require(:message).permit(:name, :email, :subject, :message)
		end

end
