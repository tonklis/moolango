class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]

	def index
		if signed_in?
			if current_user.sign_in_count == 1
				redirect_to (action_path+"?fs=true")
			else
				redirect_to action_path
			end
		end
	end

	def language

	end

	def action
		@first_signin_flag = params[:fs]
	end

	def rooms_listing
		@rooms = Room.where("status = ?", "BUSY")
	end

	def topics_list
		@language_id = session[:language] = params[:id]
		@enabled_topics = Topic.where("enabled = ?", true)
		@disabled_topics = Topic.where("enabled = ?", false)
		render :layout => "topics"
	end

	def conversation_room

		@room = Room.find(params[:id])
		@internal_session = @room.session_id
		@open_tok_session = @room.open_tok_session
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET'], :api_url => 'https://api.opentok.com/hl'
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::MODERATOR)
		@topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = @room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		@room.engage current_user.id
		render :layout => "rooms"
	end

	def admin_room	
		
	end

	def join_conversation_room

		@room = Room.find(params[:id])
		@internal_session = @room.session_id
		@open_tok_session = @room.open_tok_session
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET'], :api_url => 'https://api.opentok.com/hl'
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::MODERATOR)
		@topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@origin_user = User.find(@room.creator_id)
		@language_id = @room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		@room.engage current_user.id
		render :layout => "rooms"
	end
	
	def view_video
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET'], :api_url => 'https://api.opentok.com/hl'
		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
		session = opentok.create_session(request.remote_addr, session_properties)
		@token = opentok.generate_token(:session_id => session, :role => OpenTok::RoleConstants::MODERATOR)
		@address = request.remote_addr
		archive = opentok.get_archive_manifest("f93ca0e1-e935-4471-9c93-600bdc334354", @token)
		@urls = []
		archive.resources.each do |video|
			@urls << archive.downloadArchiveURL(video.getId, @token)
		end
	end
	
end
