class MailNotification

	@api

	def initialize
		require 'mandrill'
        @api = Mandrill::API.new
	end

	def booked_conversation user, conversation, locale
		template = locale == :en ? "moolango-conversation-booked" : "chinese-moolango-conversation-booked"
		vars = [{:name => "FNAME", :content => user.firstname}, {:name => "TOPIC", :content => conversation.topic}, {:name => "PURPOSE", :content => conversation.purpose}, {:name => "TOPIC", :content => conversation.topic}, {:name => "WHEN", :content => I18n.l(conversation.when.in_time_zone(user.timezone), :format => :moolango)}, {:name => "CONFIRM", :content => "http://www.moolango.com/confirm/" + conversation.id.to_s + "?session=" + conversation.internal_session}]
        message = {:subject => 'You booked a conversation', :from_email => "hello@moolango.com", :from_name => "MooLango", :to => [{:email => user.email, :name => user.firstname}], :track_opens => true, :track_clicks => true, :global_merge_vars => vars}
        @api.messages.send_template(template, [], message)
	end

end