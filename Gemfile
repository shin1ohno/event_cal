source "https://rubygems.org"

# Declare your gem's dependencies in event_calendar.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec
gem 'haml-rails'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
group :development do
  gem 'pry'
  gem 'rails-sh'
  gem 'tork'
  gem 'rb-fsevent', '~> 0.9.1'
end

group :test do
  gem 'response_code_matchers'
  gem 'timecop'
end
