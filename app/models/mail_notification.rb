class MailNotification

	@api

	def initialize
		require 'mandrill'
        @api = Mandrill::API.new
	end

	def booked_conversation user, conversation, locale
		template = locale == :en ? "moolango-conversation-booked" : "chinese-moolango-conversation-booked"
		url =  locale == :en ? "http://www.moolango.com/confirm/" : "http://cn.moolango.com/confirm/"
		vars = [{:name => "FNAME", :content => user.firstname}, {:name => "TOPIC", :content => conversation.topic}, {:name => "PURPOSE", :content => conversation.purpose}, {:name => "TOPIC", :content => conversation.topic}, {:name => "WHEN", :content => I18n.l(conversation.when.in_time_zone(user.timezone), :format => :moolango)}, {:name => "CONFIRM", :content => url + conversation.id.to_s + "?session=" + conversation.internal_session}]
        message = {:subject => 'Please confirm your booked conversation', :from_email => "hello@moolango.com", :from_name => "MooLango", :to => [{:email => user.email, :name => user.firstname}], :bcc_address => "hello@moolango.com", :track_opens => true, :track_clicks => true, :global_merge_vars => vars}
        @api.messages.send_template(template, [], message)
	end

end
