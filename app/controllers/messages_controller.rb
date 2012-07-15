class MessagesController < ApplicationController
  
	def index
    @messages = Message.all
  end

  def create
		event = params[:message][:session]
		Pusher['test_channel'].trigger(event, {:message => params[:message][:content], :origin => params[:message][:origin]})
    #@message = Message.create!(params[:message])
  end

end
