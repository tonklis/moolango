class TestMailer < ActionMailer::Base
  default from: "tonklis@gmail.com"

	def new_conversation(topic, token, user)
		@topic = topic
		@token = token
		@user = user
		mail(:to => "williambabeaux@gmail.com,tonklis@gmail.com,dmiramon@gmail.com", :subject => "New conversation, #{Topic.find(topic).name}")
  end
	
end
