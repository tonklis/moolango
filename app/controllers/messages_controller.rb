class MessagesController < ApplicationController
  
	def index
    @messages = Message.all
  end

  def create
		m_session = params[:message][:session]
		Pusher[m_session[6..11]].trigger(m_session[0..5], {:message => params[:message][:content], :origin => params[:message][:origin]})
    #@message = Message.create!(params[:message])
  end

	def async_outbound
		
		# begin/rescue code not needed now, since it reports back the error in the JS modal frame
		TestMailer.new_conversation(params[:topic_id], params[:session_id], params[:user]).deliver
	
		@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
		if (Language.find_by_name("english").id == session[:language].to_i)
	 		number_to_send_to = "6145968264"
			message = "There's someone waiting on Moolango to talk about #{Topic.find(params[:topic_id]).name}"
		else 
			number_to_send_to = "6142826401"
			message = "Hay una persona en Moolango esperando para hablar de #{Topic.find(params[:topic_id]).name}"
		end
		
		#@twilio_client.account.sms.messages.create(
		#  :from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
		#  :to => number_to_send_to,
	 	# :body => message
		#)
		
	end 

end
