class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
	    # You need to implement the method below in your model (e.g. app/models/user.rb)
	    @fb_response = request.env["omniauth.auth"]
	    @user = User.from_omniauth(@fb_response)

	    if @user.persisted?
	      # Update user token
          @user.fb_token = @fb_response.credentials.token
          # Deliver signup mail
	      UserNotifier.send_signup_email(@user).deliver
          # Sign in
	      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	    else
	      session["devise.facebook_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
  	end

end