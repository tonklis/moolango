class PaypalController < ApplicationController

	before_filter :authenticate_user!, :except => [:complete]

	def shopping_cart

	end

	def checkout
		session[:billing_id] = params[:id]
		
		@billing = BillingAddress.find(session[:billing_id])
		@pricing = Pricing.find(session[:pricing_id])
		billing_info = BillingAddress.find(params[:id])
		amount = @pricing.price
		@securetokenid = SecureRandom.uuid
		@mode = 'LIVE'

		uri = URI.parse("https://payflowpro.paypal.com/")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data(
		{
			'PARTNER' => 'PayPal',
			'VENDOR' => 'moolango',
			'USER' => 'moolangotroll',
			'PWD' => 'dimival1234',
			'TRXTYPE' => 'S',
			'CREATESECURETOKEN' => 'Y',
			'AMT' => '0.01',
			'SECURETOKENID' => @securetokenid,
			'BILLTOFIRSTNAME'=> billing_info.firstname,
			'BILLTOLASTNAME'=> billing_info.lastname,
			'BILLTOSTREET' => billing_info.address,
			'BILLTOCITY' => billing_info.city,
			'BILLTOSTATE' => billing_info.state,
			'BILLTOZIP' => billing_info.zipcode,
			'BILLTOCOUNTRY' => billing_info.country
			}
		)
		@response = http.request(request).body.split('&')

		@response.each do |pair|
			@securetoken = pair.split('=')[1] if pair.split('=')[0] == 'SECURETOKEN'
		end
	end

	def complete
		trans = Transaction.new
		trans.user_id = current_user.id
		trans.pricing_id = session[:pricing_id]
		trans.billing_address_id = session[:billing_id]
		trans.paypal_trans_id = params['PNREF']
		trans.save
		current_user.update_attribute(:credits, current_user.credits + Pricing.find(session[:pricing_id]).minutes)
	end

	def receipt
		@transaction = Transaction.where('user_id = ?', current_user.id).last
		@price = Pricing.find(@transaction.pricing_id).price 
		TestMailer.new_purchase(current_user.id, @transaction.paypal_trans_id, @price).deliver
		session[:pricing_id] = nil
		session[:billing_id] = nil
	end
end
