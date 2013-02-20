class Users::RegistrationsController < Devise::RegistrationsController
  protected

	def after_sign_up_path_for(resource)
		MailNotification.new.welcome_user(current_user, I18n.locale)
		dashboard_path + "?fs=true"
	end

end
