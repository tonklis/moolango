class MessagesController < ApplicationController
  
	def index
    @messages = Message.all
  end

  def create
		session = params[:message][:session]
		Pusher[session[6..11]].trigger(session[0..5], {:message => params[:message][:content], :origin => params[:message][:origin]})
    #@message = Message.create!(params[:message])
  end

end
