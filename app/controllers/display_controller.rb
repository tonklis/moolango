class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]

	def index
		if signed_in?
			redirect_to action_path
		end
	end

	def language

	end

	def action

	end

	def earn

	end

	def rooms_listing

		@rooms = Room.where("busy = ?", false)

	end

	def created_room 

	end

	def joined_room

	end

	def topics_list

		session[:language] = params[:id]
		render :layout => "topics"
	end

	def conversation_room

		@topic_id = params[:id]
		@api_key = ENV['OPENTOK_API_KEY']
    opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
    session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
    @session = opentok.create_session request.remote_addr, session_properties

		TestMailer.new_conversation(@topic_id, @session).deliver
		
		@slideshare_params = Topic.get_topic_details(@topic_id.to_i)

		render :layout => "rooms"
	end

	def admin_room	
		
	end

	def join_conversation_room

		@session = params[:session]
		@topic_id = params[:topic_id]
		@api_key = ENV['OPENTOK_API_KEY']
			
		@slideshare_params = Topic.get_topic_details(@topic_id.to_i)
		
		render :layout => "rooms"
	end 

end
