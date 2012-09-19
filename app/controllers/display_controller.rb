class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]

	#negative to remove open window constraint
	AVAILABLE_TIME = 18

	def index
		if signed_in?
			if current_user.sign_in_count == 1 and not session[:language] 
				redirect_to (action_path+"?fs=true")
			else
				redirect_to action_path
			end
		end
	end

	def come_back_later

	end

	def language
		if not is_site_open?
				redirect_to come_back_later_path
		end
	end
	
	def language_earners
		if not is_site_open?
				redirect_to come_back_later_path
		end
		@notify = EarnerForm.notify(current_user.id)
	end

	def action
		if not is_site_open?
				redirect_to come_back_later_path
		end
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

	def topics_list_earners
		@language_id = session[:language] = params[:id]
		@enabled_topics = Topic.where("enabled = ?", true)
		
		render :layout => "topics"
	end

	def conversation_room

		@room = Room.find(params[:id])
		@internal_session = @room.session_id
		@open_tok_session = @room.open_tok_session
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::MODERATOR, :connection_data => current_user.firstname)
		@topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = @room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		@room.engage
		render :layout => "rooms"
	end

	def admin_room	
		
	end

	def join_conversation_room

		@room = Room.find(params[:id])
		@internal_session = @room.session_id
		@open_tok_session = @room.open_tok_session
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::MODERATOR, :connection_data => current_user.firstname)
		@topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = @room.language_id
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		
		@room.engage
		render :layout => "rooms"
	end
	
	def view_video
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		session = opentok.create_session(request.remote_addr)
		@token = opentok.generate_token(:session_id => session, :role => OpenTok::RoleConstants::MODERATOR)
		@address = request.remote_addr
		archive = opentok.get_archive_manifest("e7d0affb-3b7c-4633-865e-5ce702ab6799", @token)
		@urls = []
		archive.resources.each do |video|
			@urls << archive.downloadArchiveURL(video.getId, @token)
		end
	end

	private

	def is_site_open?
		Time.use_zone("Mexico City") do
			mex_time = Time.now.in_time_zone
			if AVAILABLE_TIME > 0 and mex_time.hour == AVAILABLE_TIME
				return true
			else
				return false
			end
		end
	end

end
