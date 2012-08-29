class Room < ActiveRecord::Base

	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
	belongs_to :joiner, :class_name => "User", :foreign_key => :joiner_id
	belongs_to :language
	belongs_to :topic
	has_many :evaluation_buyers
	has_many :evaluation_sellers
	has_many :messages

	def self.create_available user_id, topic_id, language_id, internal_session
		rooms_to_close = Room.where("creator_id = ? and status = 'WAITING'", user_id)
		rooms_to_close.each do |rtc|
			rtc.status = "CLOSED"
			rtc.save
		end

		opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET'], :api_url => 'https://api.opentok.com/hl'
		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "disabled"}
		open_tok_session = opentok.create_session(nil, session_properties)

		room = Room.create(
			:creator_id => user_id,
			:name => Topic.find(topic_id).name,
			:status => "WAITING",
			:language_id => language_id,
			:topic_id => topic_id,
			:session_id => internal_session,
			:open_tok_session => open_tok_session.to_s
		)
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
	
	def self.finish_call room_id
		room = Room.find(room_id)
		if room.status == "JOINED"
			room.status = "CANCELLED"
		elsif room.status == "ENGAGED"
			room.status = "ENDED"
		end
		room.save!
		room
	end

	def engage
		if self.status == "WAITING"
			self.status = "JOINED"
		elsif self.status.match(/JOINED/)
			self.status = "ENGAGED"
		end
		self.save
	end

	def self.available language_id
		
		result_by_topic = {}
		rooms_available = Room.where("language_id = ? and status = 'JOINED'", language_id).order("created_at DESC")
		rooms_available.each do |room|
			result_by_topic[room.topic_id] = room.id
		end
		result_by_topic
	end

end
