class Language < ActiveRecord::Base

	belongs_to :conversation
	has_many :hints
end
