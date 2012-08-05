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
			Pusher[internal_session].trigger('room_info', {:room_id => room.id})
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
