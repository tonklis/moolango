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

		@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
		if (Language.find_by_name("english").id == session[:language].to_i)
			number_to_send_to = "6145968264"
			message = "There's someone waiting on Moolango to talk about #{Topic.find(@topic_id).name}"
		else 
			number_to_send_to = "6142826401"
			message = "Hay una persona en Moolango esperando para hablar de #{Topic.find(@topic_id).name}"
		end
		
		@twilio_client.account.sms.messages.create(
		  :from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
		  :to => number_to_send_to,
		  :body => message
		)
		
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
