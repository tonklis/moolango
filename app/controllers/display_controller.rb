class DisplayController < ApplicationController

	def index

	end

	def rooms_listing

		@rooms = Room.where("busy = ?", false)

	end

	def created_room 

	end

	def joined_room

	end

	def topics_list

	end

	def conversation_room

		@topic_id = params[:id]
		@api_key = ENV['OPENTOK_API_KEY']
    opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
    session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
    @session = opentok.create_session request.remote_addr, session_properties

		TestMailer.new_conversation(@topic_id, @session).deliver

	end

	def admin_room	
		
	end

	def join_conversation_room

		@session = params[:session]
		@topic_id = params[:topic_id]
		@api_key = ENV['OPENTOK_API_KEY']
			
	end 

end
