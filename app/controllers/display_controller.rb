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
		@first_signin_flag = params[:fs]
	end

	def rooms_listing
		@rooms = Room.where("busy = ?", false)
	end

	def topics_list
		session[:language] = params[:id]
		@topics = Topic.order("id DESC")
		render :layout => "topics"
	end

	def conversation_room

		@topic_id = params[:id]
		@joined_user = User.find(params[:user_id])
		@api_key = ENV['OPENTOK_API_KEY']
		@session = params[:session]
		@token = params[:token]
		@language_id = session[:language]
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		# CREATE ROOM
		Room.create(
			:creator_id => params[:user_id],
			:joiner_id => current_user.id,
			:name => Topic.find(@topic_id).name,
			:busy => true,
			:language_id => @language_id
		)
		render :layout => "rooms"

	end

	def admin_room	
		
	end

	def join_conversation_room
		
		@topic_id = params[:topic_id]
		@api_key = ENV['OPENTOK_API_KEY']
		@origin_user = User.find(params[:user_id])
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
		@session = opentok.create_session(request.remote_addr, session_properties)
		@token = opentok.generate_token(:session_id => @session, :role => OpenTok::RoleConstants::MODERATOR)
		@language_id = params[:language_id]
		@hints = Hint.per_topic_and_language(@topic_id, @language_id)
		Pusher[params[:session]].trigger('confirm_channel', {:message => "OK", :session => @session.to_s, :topic_id => @topic_id, :user_id => current_user.id, :token => @token})
		
		render :layout => "rooms"
	end
	
	def view_video
		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
		session = opentok.create_session(request.remote_addr, session_properties)
		token = opentok.generate_token(:session_id => @session, :role => OpenTok::RoleConstants::MODERATOR)
		archive = opentok.get_archive_manifest("301e1ddb-b4df-4c59-83f5-982837a7149f", token)
		@urls = []
		archive.resources.each do |video|
			@urls << archive.downloadArchiveURL(video.getId, token)
		end
		
		render :layout => "rooms"
	end
	
end
