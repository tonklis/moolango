class Status < ActiveRecord::Base
	has_many :conversations
end
