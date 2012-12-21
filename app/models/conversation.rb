class Conversation < ActiveRecord::Base
    belongs_to :buyer, :class_name => "User", :foreign_key => :buyer_id
    belongs_to :seller, :class_name => "User", :foreign_key => :seller_id
    has_many :languages
    has_many :statuses
    has_many :evaluation_buyers
    has_many :evaluation_sellers
	
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
