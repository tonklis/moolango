class BillingAddress < ActiveRecord::Base
	belongs_to :user
	has_many :transactions

	#TODO: check required fields
end
