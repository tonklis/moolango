class MessagesController < ApplicationController
  
	def index
		@messages = Message.all
	end

	def create
		channel = params[:message][:channel]
		Pusher[channel].trigger('event_chat', {:message => params[:message][:content], :origin => params[:message][:origin]})
		#@message = Message.create!(params[:message])
	end

	def async_outbound

		internal_session = params[:internal_session]
		room = Room.find_available(params[:user_id], params[:topic_id], params[:language_id], internal_session)

		if room.status == "WAITING"
			
			# Pusher[internal_session].trigger('room_info', {:room_id => room.id})

			# adding previous async notifications for testing purposes
			TestMailer.new_conversation(params[:topic_id], params[:user_id], params[:language_id]).deliver

			@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
			if (Language.find_by_name("english").id == session[:language_id].to_i)
				number_to_send_to = "6145968264"
				message = "Waiting to talk about #{Topic.find(params[:topic_id]).name} in #{Language.find(params[:language_id]).name}"
			else 
				number_to_send_to = "6142826401"
				message = "Esperando a hablar sobre #{Topic.find(params[:topic_id]).name} en #{Language.find(params[:language_id]).name}"
			end

			@twilio_client.account.sms.messages.create(
				:from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
				:to => number_to_send_to,
				:body => message
			)

		elsif room.status == "BUSY"
			opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
			session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
			open_tok_session = opentok.create_session(request.remote_addr, session_properties)
			token = opentok.generate_token(:session_id => @session, :role => OpenTok::RoleConstants::MODERATOR)
			Pusher[internal_session].trigger('confirm_event',{:message => "OKO", :internal_session => room.session_id, :open_tok_session => open_tok_session.to_s, :room_id => room.id, :creator_id => room.creator_id, :joiner_id => room.joiner_id, :token => token })
			Pusher[room.session_id].trigger('confirm_event',{:message => "OK", :internal_session => room.session_id, :open_tok_session => open_tok_session.to_s, :room_id => room.id, :creator_id => room.creator_id, :joiner_id => room.joiner_id, :token => token })
		end

	end 

end
