class WelcomeController < ApplicationController
  def index

  	if user_signed_in?

	  	@user = current_user

	  	@graph = Koala::Facebook::API.new(@user.fb_token)
		@user_fb = @graph.get_object("me?fields=name,id,location")

		# Get user location
		# If no facebook location provided, use geocoder
		if @user_fb['location'] == [] or @user_fb['location'] == nil
			@geo_location = request.location
		# Else use facebook location, look up specifics on geocoder
		else
			@user_fb_location = @user_fb['location']['name']
			@geo_location = Geocoder.search(@user_fb_location)[0]
		end

	end
  end
end
