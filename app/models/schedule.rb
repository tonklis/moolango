class Schedule < ActiveRecord::Base

	has_and_belongs_to_many :topics
	belongs_to :user
	belongs_to :room

	def self.find_available user
		user.schedules.each do |schedule|
			if ( Time.now >= (schedule.when - 5.minutes) ) and ( Time.now <= (schedule.when + 5.minutes) )
				return schedule
			end
		end
		return nil
	end

end
