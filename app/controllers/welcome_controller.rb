class WelcomeController < ApplicationController
  def index

  	if user_signed_in?

	  	@user = current_user

		# Facebook graph api load for user
		@graph = Koala::Facebook::API.new(@user.fb_token)
		@user_fb = @graph.get_object("me?fields=name,id,location,events,likes,friends,posts")
		@user_past_fb_events = @user_fb['events']['data']
		@user_fb_likes = @user_fb['likes']['data']
		@user_fb_posts = @user_fb['posts']['data']

		# General hash of word counts generator
		def word_counter(data, attribute)
			words_hash = {}
			data.each do |hash_object|
				# for each word in the string
				string = hash_object[attribute]
				unless string == nil
					string.split(" ").each do |word|
						# if already in hash
						if words_hash.has_key?(word)
							# iterate it
							words_hash[word] += 1
						# otherwise
						else
							# add new word and +1
							words_hash[word] = 1
						end
					end
				end
			end

			return words_hash.sort_by {|key, value| value}.reverse.to_h
		end

		# Generate some interesting data
		@events_name_word_count = word_counter(@user_past_fb_events, 'name')
		@events_description_word_count = word_counter(@user_past_fb_events, 'description')
		@likes_word_count = word_counter(@user_fb_likes, 'name')
		@posts_message_word_count = word_counter(@user_fb_posts, 'message')
		@posts_story_word_count = word_counter(@user_fb_posts, 'story')

		# Add together word count totals
		def word_count_merger(hashes)
			merged = {}
			hashes.each do |hash|
				merged = merged.merge(hash) {|key, val1, val2| val1 + val2}
			end
			return merged.sort_by {|key, value| value}.reverse.to_h
		end

		@total_word_count = word_count_merger([@events_name_word_count, @events_description_word_count, @likes_word_count, @posts_message_word_count, @posts_story_word_count])
		

	end
  end
end
