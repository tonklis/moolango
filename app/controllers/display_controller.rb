class DisplayController < ApplicationController

	def index

	end

	def rooms_listing

		@rooms = Room.where("busy = ?", false)

	end

	def created_room 

	end

	def joined_room

	end
end
