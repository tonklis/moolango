class Language < ActiveRecord::Base

	has_many :conversations
	has_many :hints
end
