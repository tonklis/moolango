class Schedule < ActiveRecord::Base

	has_and_belongs_to_many :topics
	belongs_to :user
	belongs_to :room

	validates_presence_of :language_id, :purpose, :options, :user_id, :when

	def self.find_available user
		user.schedules.each do |schedule|
			if ( Time.now >= (schedule.when - 5.minutes) ) and ( Time.now <= (schedule.when + 5.minutes) )
				return schedule
			end
		end
		return nil
	end

	def self.get_options current_user, options
		#FREE TRIALS
		if current_user.credits == 15
			return [['15 minutes', 15]]
		else
			total_time = 0
    	current_user.schedules.each do |schedule|
      	total_time += schedule.length unless schedule.when <= Time.now
    	end
    	options.pop if (current_user.credits - total_time < 60)
			return options
		end
	end

end
