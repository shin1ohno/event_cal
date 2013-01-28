source "https://rubygems.org"

# Declare your gem's dependencies in event_cal.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec
gem 'haml-rails'
gem 'timecop'

unless ENV['CI']
  gem 'libv8', '~> 3.11.8'
  gem 'therubyracer', platforms: :ruby
  gem 'em-websocket'
  gem 'pry'
  gem 'rails-sh'
  gem 'tork'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'guard-shell'
  gem 'guard-jasmine-headless-webkit'
end
