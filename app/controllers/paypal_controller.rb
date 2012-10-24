class PaypalController < ApplicationController

	before_filter :authenticate_user!, :except => [:complete]
	
	def billing

	end

	def checkout
		billing_info = BillingAddress.find(params[:id])
		@securetokenid = SecureRandom.uuid
		@mode = 'LIVE'
		#paypal_params = {:PARTNER => "PayPal", :VENDOR => "moolango", 
		#	:USER => "moolangotroll", :PWD => "dimival", :TRXTYPE => "S", :AMT => "14.99",
		#	:CREATESECURETOKEN => "Y", :SECURETOKENID => @securetokenid}
		#curl = Curl::Easy.new("https://pilot-payflowpro.paypal.com/")
		curl = Curl::Easy.new("https://payflowpro.paypal.com/")
		curl.ssl_verify_host = false
		curl.ssl_verify_peer = false
		curl.post(
			Curl::PostField.content('PARTNER', 'PayPal'),
			Curl::PostField.content('VENDOR', 'moolango'),
			Curl::PostField.content('USER', 'moolangotroll'),
			Curl::PostField.content('PWD', 'dimival1234'),
			Curl::PostField.content('TRXTYPE', 'A'),
			Curl::PostField.content('AMT', '0.01'),
			Curl::PostField.content('CREATESECURETOKEN', 'Y'),
			Curl::PostField.content('SECURETOKENID', @securetokenid),
			Curl::PostField.content('BILLTOFIRSTNAME', billing_info.firstname),
			Curl::PostField.content('BILLTOLASTNAME', billing_info.lastname),
			Curl::PostField.content('BILLTOSTREET', billing_info.address),
			Curl::PostField.content('BILLTOCITY', billing_info.city),
			Curl::PostField.content('BILLTOSTATE', billing_info.state),
			Curl::PostField.content('BILLTOZIP', billing_info.zipcode),
			Curl::PostField.content('BILLTOCOUNTRY', billing_info.country),
			)
		@response = curl.body_str.split('&')
		@response.each do |pair|
			@securetoken = pair.split('=')[1] if pair.split('=')[0] == 'SECURETOKEN'
		end
	end

	def complete
		session["paypal_response"] = params
	end

	def receipt
		@valores = session["paypal_response"]
	end
end