class InteractionController < ApplicationController

	def create
		session = params[:session]
		topic = Topic.find(params[:topic_id])
		language = Language.find(params[:language_id])
		next_hint = topic.next_hint(Hint.per_topic_and_language(topic, language), params[:next], params[:current_slide])
		Pusher[session[6..11]].trigger(session[0..5], {:thumbnail_url => next_hint.thumbnail_url, :description => next_hint.description, :id => next_hint.id})
	end
	
	def end_call
		Pusher['channel_messages'].trigger('end_call', {:message => 'call has ended'})
	end	

end
