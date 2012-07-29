class TestMailer < ActionMailer::Base
  default from: "tonklis@gmail.com"

	def new_conversation(topic, token, user)
		@topic = Topic.find(topic)
		@token = token
		@user = User.find(user)
		mail(:to => "tonklis@gmail.com", :subject => "New conversation with #{@user.firstname}, about #{@topic.name}")
  end
	
end
