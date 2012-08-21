class EarnerForm < ActiveRecord::Base
		belongs_to :user
		validates_presence_of :email, :agree

		def self.notify user_id
			form = EarnerForm.where("user_id = ?", user_id)
			form.empty?
		end
end
