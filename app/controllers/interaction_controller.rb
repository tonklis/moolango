class InteractionController < ApplicationController

	before_filter :authenticate_user!

	def create
		channel = params[:channel]
		topic = Topic.find(params[:topic_id])
		language = Language.find(params[:language_id])
		next_hint = topic.next_hint(Hint.per_topic_and_language(topic, language), params[:next], params[:current_slide])
		Pusher[channel].trigger('event_slider', {:thumbnail_url => next_hint.thumbnail_url, :description => next_hint.description, :id => next_hint.id})
	end
	
	def end_call
		channel = params[:channel]
		Room.update_status(params[:room_id], "ENDED")
		Pusher[channel].trigger('event_end_call', {:message => 'call has ended'})
	end	

end
