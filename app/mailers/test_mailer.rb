class TestMailer < ActionMailer::Base
  default from: "tonklis@gmail.com"

	def new_conversation(topic, token)
    @topic = topic
		@token = token
		mail(:to => "tonklis@gmail.com", :subject => "New conversation, #{topic}, #{token}")
  end
	
end
