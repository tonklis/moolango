class InteractionController < ApplicationController

	def create
		session = params[:session]
		topic = Topic.find(params[:topic_id])
		next_hint = topic.next_hint(params[:next], params[:current_slide])
		Pusher[session[6..11]].trigger(session[0..5], {:thumbnail_url => topic.hints[1].thumbnail_url, :current_text => next_hint[:text], :current_image => next_hint[:number]})
	end	

end
