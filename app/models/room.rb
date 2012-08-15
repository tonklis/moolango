class Room < ActiveRecord::Base

	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
	belongs_to :joiner, :class_name => "User", :foreign_key => :joiner_id
	belongs_to :language
	belongs_to :topic
	has_many :feedback_forms

	def self.find_available user_id, topic_id, language_id, internal_session
		rooms_to_close = Room.where("creator_id = ? and status = 'WAITING'", user_id)
		rooms_to_close.each do |rtc|
			rtc.status = "CLOSED"
			rtc.save
		end

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
			room.status = "HANDSHAKE"
			room.joiner_id = user_id
			room.save
		end
		room
	end

	def self.cancel user_id
			
		rooms_to_close = Room.where("creator_id = ? and status = 'WAITING'", user_id)
		rooms_to_close.each do |rtc|
			rtc.status = "CANCELLED"
			rtc.save
		end
		rooms_to_close
	end

	def self.update_status room_id, status, open_tok_session = nil
		room = Room.find(room_id)
		room.status = status
		room.open_tok_session = open_tok_session if open_tok_session
		room.save!
		room
	end

	def engage user_id
		if self.status == "BUSY"
			self.status = "JOINED_#{user_id}"
		elsif self.status.match(/JOINED/)
			self.status = "ENGAGED"
		end
		self.save
	end

end
