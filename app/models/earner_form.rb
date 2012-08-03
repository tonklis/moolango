class EarnerForm < ActiveRecord::Base
		belongs_to :user
		validates_presence_of :email, :agree
		validates_inclusion_of :pricing, :donate, :in => [true, false]
end
