ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {

	:address	=> "smtpout.secureserver.net",
	:port		=> 80,
	:domain		=> "moolango.com",
	:user_name	=> "hello@moolango.com",
	:password	=> "grandcayman",
	:authentication	=> "plain"
}

