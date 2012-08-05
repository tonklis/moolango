class Room < ActiveRecord::Base

	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
	belongs_to :joiner, :class_name => "User", :foreign_key => :joiner_id
	belongs_to :language
	belongs_to :topic

	def self.find_available user_id, topic_id, language_id, internal_session
		rooms_available = Room.where("language_id = ? and topic_id = ? and status = 'WAITING'", language_id, topic_id)
		if rooms_available.empty?
			room = Room.create(
				:creator_id => user_id,
				:name => Topic.find(topic_id).name,
				:status => "WAITING",
				:language_id => language_id,
				:topic_id => topic_id,
				:session_id => internal_session
			)
		else
			room = rooms_available.first
			room.status = "BUSY"
			room.joiner_id = user_id
			room.save
		end
		room
	end

	def self.cancel room_id
		room = Room.find(room_id)
		room.status = "CANCELLED"
		room.save
		room
	end

end
