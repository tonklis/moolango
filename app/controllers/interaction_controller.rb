class InteractionController < ApplicationController

	before_filter :authenticate_user!

#	def create
#		channel = params[:channel]
#		topic = Topic.find(params[:topic_id])
#		language = Language.find(params[:language_id])
#		next_hint = topic.next_hint(Hint.per_topic_and_language(topic, language), params[:next], params[:current_slide])
#		Pusher[channel].trigger('event_slider', {:thumbnail_url => next_hint.thumbnail_url, :description => next_hint.description, :id => next_hint.id})
#	end

	def create
		channel = params[:channel]
		button_pressed = params[:button_pressed]
		Pusher[channel].trigger('event_interaction', {:button_pressed => button_pressed}) if channel
		respond_to do |format|
			format.json { render json: button_pressed}
		end
	end
	
	def end_call
		channel = params[:channel]
		room = Room.finish_call(params[:room_id])
		Pusher[channel].trigger('event_end_call', {:message => 'call has ended'}) if channel
		respond_to do |format|
			format.json { render json: room }
		end
	end	

end
