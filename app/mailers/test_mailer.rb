class TestMailer < ActionMailer::Base
	default from: "\"MooLango\" <hello@moolango.com>"

	def new_conversation(topic, user, language)
		@topic = Topic.find(topic)
		@user = User.find(user)
		@language = Language.find(language.to_i)
		mail(:to => "tonklis@gmail.com, dmiramon@gmail.com, williambabeaux@gmail.com", :subject => "New conversation with #{@user.firstname}, about #{@topic.name}")
  end

	def new_purchase(user_id, reference, amount)
		@user = User.find(user_id)
		@reference = reference
		@amount = amount
		mail(:to => @user.email, :subject => "Order confirmation from MooLango")
	end

	def new_simple_conversation(user_id, room_id)
		@user = User.find(user_id)
		@room_id = room_id
		mail(:to => "tonklis@gmail.com, dmiramon@gmail.com, williambabeaux@gmail.com", :subject => "New conversation with #{@user.firstname}")
  end

	def new_scheduling(schedule)
		@user = User.find(schedule.user_id)
		@schedule = schedule
		mail(:to => "tonklis@gmail.com, dmiramon@gmail.com, williambabeaux@gmail.com", :subject => "New conversation scheduled with #{@user.firstname}")
	end

end
