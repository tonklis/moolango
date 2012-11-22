class BillingAddress < ActiveRecord::Base
	belongs_to :user
	has_many :transactions

	validates_presence_of :firstname, :lastname, :address, :city, :zipcode, :state, :country, :user_id
end
