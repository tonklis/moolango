class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_locale

	def set_locale
  	I18n.locale = extract_locale_from_subdomain || I18n.default_locale
	end

	def extract_locale_from_subdomain
		parsed_locale = request.subdomains.first
  	parsed_locale ? (I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil) : nil
	end

	rescue_from CanCan::AccessDenied do |exception|
		render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end
	
end
