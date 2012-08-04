class Language < ActiveRecord::Base

	has_many :rooms
	has_many :hints

end
