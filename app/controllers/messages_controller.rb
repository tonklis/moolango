class MessagesController < ApplicationController
 
	before_filter :authenticate_user!

	def index
		@messages = Message.all
	end

	def create
		channel = params[:message][:channel]
		Pusher[channel].trigger('event_chat', {:message => "#{User.find(params[:message][:user_id]).firstname}: #{params[:message][:content]}", :origin => params[:message][:origin]})
		@message = Message.create!(params[:message].except(:channel, :origin))
	end

	def topic_redirect
	
		internal_session = params[:internal_session]
		room = Room.create_available(params[:user_id], params[:topic_id], params[:language_id], internal_session, request.remote_addr)
    user = User.find(params[:user_id])

		#TestMailer.new_conversation(params[:topic_id], params[:user_id], params[:language_id]).deliver

		@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
		if (Language.find_by_name("english").id == params[:language_id].to_i)
			number_to_send_to = "6145968264"
			message = "#{user.firstname} waiting to talk about #{Topic.find(params[:topic_id]).name}"
		else
			# change to other phone for Spanish
			number_to_send_to = "6145968264"
			message = "#{user.firstname} esperando a hablar sobre #{Topic.find(params[:topic_id]).name}"
		end

		@twilio_client.account.sms.messages.create(
			:from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
			:to => number_to_send_to,
			:body => message
		)

		respond_to do |format|
			format.json { render json: {:handshake => false, :room_id => room.id} }
	  end	

	end

end
