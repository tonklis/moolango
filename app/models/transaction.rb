class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :pricing
	belongs_to :billing_address
end
