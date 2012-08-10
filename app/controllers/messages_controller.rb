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
			
			# adding previous async notifications for testing purposes
			TestMailer.new_conversation(params[:topic_id], params[:user_id], params[:language_id]).deliver

			@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
			if (Language.find_by_name("english").id == params[:language_id].to_i)
				number_to_send_to = "6145968264"
				message = "Waiting to talk about #{Topic.find(params[:topic_id]).name} in #{Language.find(params[:language_id]).name}"
			else 
				number_to_send_to = "6142826401"
				message = "Esperando a hablar sobre #{Topic.find(params[:topic_id]).name} en #{Language.find(params[:language_id]).name}"
			end

			#@twilio_client.account.sms.messages.create(
			#	:from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
			#	:to => number_to_send_to,
			#	:body => message
			#)

			respond_to do |format|
				format.json { render json: {:message => "WAITING"} }
	    end
		elsif room.status == "HANDSHAKE"
			opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']#, :api_url => 'http://api.opentok.com/hl'
			session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
			open_tok_session = opentok.create_session(request.remote_addr, session_properties)
			token = opentok.generate_token(:session_id => open_tok_session, :role => OpenTok::RoleConstants::MODERATOR)

			respond_to do |format|
      	format.json { render json: {:handshake => true, :room_id => room.id, :open_tok_session => open_tok_session.to_s, :token => token } }
	    end
		end
	end

	def confirm_chat

		internal_session = params[:internal_session]
		open_tok_session = params[:open_tok_session]
		token = params[:token]
		room = Room.make_busy(params[:room_id])
		puts("ROOM TO YAML")
		puts(room.to_yaml)

		Pusher[internal_session].trigger('confirm_event',{:message => "handshake", :internal_session => room.session_id, :open_tok_session => open_tok_session.to_s, :room_id => room.id, :creator_id => room.creator_id, :joiner_id => room.joiner_id, :token => token })
		Pusher[room.session_id].trigger('confirm_event',{:message => "handshake", :internal_session => room.session_id, :open_tok_session => open_tok_session.to_s, :room_id => room.id, :creator_id => room.creator_id, :joiner_id => room.joiner_id, :token => token })

		puts("SESSION TO YAML")
		puts(room.session_id)

		respond_to do |format|
				format.json { render json: {:message => "BUSY", :internal_session => internal_session, :room_session => room.session_id} }
	   end

	end	

end
