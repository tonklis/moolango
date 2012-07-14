class MessagesController < ApplicationController
  
	def index
    @messages = Message.all
  end

  def create
		Pusher['test_channel'].trigger('my_event', {:message => params[:message][:content], :origin => params[:message][:origin]})
    #@message = Message.create!(params[:message])
  end

end
