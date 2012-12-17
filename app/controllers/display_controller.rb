class DisplayController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :paypal_purchase, :topics_list_feedback, :thank_you, :about]

	#negative to remove open window constraint
	AVAILABLE_TIME = -1

	def index
		if signed_in?
			#session[:language] is obsolete, modify when we find out the new rule
			if current_user.sign_in_count == 1 and not session[:language] 
				redirect_to (action_path+"?fs=true")
			else
				redirect_to action_path
			end
		end
	end

	def come_back_later
	end

	def schedule_conversation
	end

	def language
	end

	def about
	end

	def thank_you
		render :layout => "feedback"
	end
	
	def language_earners
		@notify = EarnerForm.notify(current_user.id)
	end

	def action
		# on standby till we define welcome message
		#@first_signin_flag = params[:fs]
		@schedule = Schedule.find_available(current_user)
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

	def topics_list_feedback
		render :layout => "feedback"
	end

	def conversation_room
		@room = Room.find(params[:id])
		@internal_session = @room.session_id
		@open_tok_session = @room.open_tok_session
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => current_user.firstname)
		# @topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = @room.language_id
		@schedule = @room.schedule
		# @hints = Hint.per_topic_and_language(@topic_id, @language_id)
		@bucket_location = @schedule.bucket
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
		@token = opentok.generate_token(:session_id => @open_tok_session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => current_user.firstname)
		# @topic_id = @room.topic_id
		@api_key = ENV['OPENTOK_API_KEY']
		@language_id = @room.language_id
		@schedule = @room.schedule
		# @hints = Hint.per_topic_and_language(@topic_id, @language_id)
		@bucket_location = @schedule.bucket
		@room.engage
		render :layout => "rooms"
	end
	
	def view_video
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		session = opentok.create_session(request.remote_addr)
		@token = opentok.generate_token(:session_id => session, :role => OpenTok::RoleConstants::MODERATOR)
		@address = request.remote_addr
		@result = opentok.stitchArchive("d4319cee-15fb-4df3-acc9-5ee41f404bbd")
		archive = opentok.get_archive_manifest("d4319cee-15fb-4df3-acc9-5ee41f404bbd", @token)
		@urls = []
		archive.resources.each do |video|
			@urls << archive.downloadArchiveURL(video.getId, @token)
		end
	end

	private

	# unused code to limit available practice hours
	def is_site_open?
		Time.use_zone("Mexico City") do
			mex_time = Time.now.in_time_zone
			if AVAILABLE_TIME < 0 or mex_time.hour == AVAILABLE_TIME
				return true
			else
				return false
			end
		end
	end

end
