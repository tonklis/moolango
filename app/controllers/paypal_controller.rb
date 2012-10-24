class PaypalController < ApplicationController

	before_filter :authenticate_user!, :except => [:complete]

	def shopping_cart

	end

	def billing
		session[:pricing_id] = params[:pricing]
	end

	def checkout
		session[:billing_id] = params[:id]
		billing_info = BillingAddress.find(params[:id])
		amount = Pricing.find(session[:pricing_id]).price
		@securetokenid = SecureRandom.uuid
		@mode = 'LIVE'
		
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
		session[:paypal_response] = params
		trans = Transaction.new
		trans.user_id = current_user.id
		trans.pricing_id = session[:pricing_id]
		trans.billing_address_id = session[:billing_id]
		trans.paypal_trans_id = params['PNREF']
		trans.save
		current_user.update_attribute(:credits, current_user.credits + Pricing.find(session[:pricing_id]).minutes)
	end

	def receipt
		@valores = session[:paypal_response]
		session[:paypal_response] = nil
		session[:pricing_id] = nil
		session[:billing_id] = nil
	end
end