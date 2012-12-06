class ApplicationController < ActionController::Base
  protect_from_forgery
	
	def check_access
		redirect_to "/404.html" and return unless (current_user.email == "tonklis@gmail.com" or current_user.email == "dmiramon@gmail.com" or current_user.email == "williambabeaux@gmail.com")
	end
end
