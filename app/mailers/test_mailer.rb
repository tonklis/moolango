class TestMailer < ActionMailer::Base
  default from: "tonklis@gmail.com"

	def new_conversation(topic, token, user, language)
		@topic = Topic.find(topic)
		@token = token
		@user = User.find(user)
		@language = Language.find(language.to_i)
		mail(:to => "williambabeaux@gmail.com,tonklis@gmail.com,dmiramon@gmail.com", :subject => "New conversation with #{@user.firstname}, about #{@topic.name}")
  end
	
end
