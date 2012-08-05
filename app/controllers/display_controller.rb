class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]

	def index
		if signed_in?
			redirect_to (action_path+"?fs=true")
		end
	end

	def language

	end

	def action
		@first_signin_flag = params[:fs]
	end

	def rooms_listing
		@rooms = Room.where("busy = ?", false)
	end

	def topics_list
		@language_id = session[:language] = params[:id]
		@topics = Topic.order("id DESC")
		render :layout => "topics"
	end

	def conversation_room

		@room = Room.find(params[:id])
		@internal_session = params[:internal_session]
		@open_tok_session = params[:open_tok_session]
		@token = params[:token]
		@topic_id = room.topic_id
		@joined_user = User.find(room.joiner_id)
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		render :layout => "rooms"
	end

	def admin_room	
		
	end

	def join_conversation_room

		@room = Room.find(params[:id])
		@internal_session = params[:internal_session]
		@open_tok_session = params[:open_tok_session]
		@token = params[:token]
		@topic_id = room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@origin_user = User.find(room.creator_id)
		@language_id = room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		render :layout => "rooms"
	end
	
	def view_video
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
		session = opentok.create_session(request.remote_addr, session_properties)
		token = opentok.generate_token(:session_id => @session, :role => OpenTok::RoleConstants::MODERATOR)
		archive = opentok.get_archive_manifest("d3ae5c29-2e21-446d-aa1e-442531304d62", token)
		@urls = []
		archive.resources.each do |video|
			@urls << archive.downloadArchiveURL(video.getId, token)
		end
		
		render :layout => "rooms"
	end
	
end
