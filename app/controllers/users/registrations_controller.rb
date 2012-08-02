class Users::RegistrationsController < Devise::RegistrationsController
  protected

	def after_sign_up_path_for(resource)
		action_path + "?fs=true"
	end

end
