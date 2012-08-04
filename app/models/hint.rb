class Hint < ActiveRecord::Base
	belongs_to :topic
	belongs_to :language

	def self.per_topic_and_language topic_id, language_id
		Hint.where("topic_id = ? AND language_id = ?", topic_id, language_id)
	end
end
