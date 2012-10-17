source 'http://rubygems.org'
require 'rubygems'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'curb'
gem 'devise'
gem 'opentok', " ~> 0.0.91"
gem 'omniauth-facebook'
gem 'pusher'
gem 'twilio-ruby'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'twitter-bootstrap-rails', :git => "git://github.com/seyhunak/twitter-bootstrap-rails.git", :branch => "static"
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
	gem 'sqlite3'
end
group :production do
	gem 'pg'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
	gem 'sqlite3'
end