class WelcomeController < ApplicationController
  def index

  	if user_signed_in?

	  	@user = current_user

		# Facebook graph api load for user
		@graph = Koala::Facebook::API.new(@user.fb_token)
		@user_fb = @graph.get_object("me?fields=name,id,location,events,likes,friends")
	end
  end
end
