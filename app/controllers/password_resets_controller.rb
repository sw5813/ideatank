class PasswordResetsController < ApplicationController
	def new
		if current_user
			redirect_to user_path(current_user)
		end
	end

	def create
		user = User.find_by(email: params[:password_reset][:email].downcase)
		if user
			user.send_password_reset
			redirect_to signin_path, notice: "An email has been sent with password reset instructions."
		else
			flash[:notice] = "Sorry, that email wasn't found in our database. Are you sure you typed in the correct email address?"
			redirect_to :back
		end
	end

	def edit
		@user = User.find_by!(password_reset_token: params[:id])
		if @user.nil?
			redirect_to signin_path, notice: "Password reset does not exist."
		elsif @user.password_reset_sent_at < 2.hours.ago
			redirect_to signin_path, notice: "Password reset has expired."
		end

	end

	def update
		@user = User.find_by!(password_reset_token: params[:id])
		if @user.password_reset_sent_at < 2.hours.ago
			redirect_to new_password_reset_path, alert: "Password reset has expired. Please reenter your email. "
		elsif @user.valid_attribute?(:password, user_params[:password]) && @user.valid_attribute?(:password_confirmation, user_params[:password_confirmation])
			@user.attributes = user_params
			@user.password_reset_token = nil
			@user.save!(validate: false)
			redirect_to signin_path, notice: "Password has been reset!"
		else
			flash[:error] = "Password is less than the required 6 characters long and/or password confirmation doesn't match."
			render 'edit'
		end
	end

	private

		def user_params
    		params.require(:user).permit(:password, :password_confirmation)
    	end
end
