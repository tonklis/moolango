class Conversation < ActiveRecord::Base
    belongs_to :buyer, :class_name => "User", :foreign_key => :buyer_id
    belongs_to :seller, :class_name => "User", :foreign_key => :seller_id
    belongs_to :language
    belongs_to :status
    has_many :evaluation_buyers
    has_many :evaluation_sellers
    has_many :messages
	
    validates_presence_of :language_id, :purpose, :topic, :buyer_id, :when

    def self.create_new values, opentok

        conversation = Conversation.create(
            :when => values[:when],
            :language_id => values[:language_id],
            :topic => values[:topic],
            :duration => values[:duration],
            :purpose => values[:purpose],
            :buyer_id => values[:buyer_id],
            :status_id => Status.find_by_name("open").id,
            :internal_session => SecureRandom.uuid.slice(0,7),
            :opentok_session => opentok.to_s
        )
        conversation
    end

    def is_ready
        if (self.status_id == Status.find_by_name("open").id) && (Time.now >= (self.when - 5.minutes)) && ( Time.now <= (self.when + 5.minutes))
            return true
        end
        return false
    end

    def close
        self.update_attribute(:status_id, Status.find_by_name("closed").id)
        return self
    end

    def self.get_options current_user, options
        #FREE TRIALS
        if current_user.credits == 15
	       return [['15 minutes', 15]]
        else
	       total_time = 0
    	   current_user.buyer_conversations.each do |conversation|
                total_time += conversation.duration unless conversation.status_id != Status.find_by_name("open").id
    	   end
    	 
    	    if (current_user.credits - total_time < 60)
    	        options.pop
    	    end
    	    return options
	    end
    end
end
