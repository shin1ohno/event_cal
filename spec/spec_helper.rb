ENV['RAILS_VERSION'] ||= `bundle exec rails -v | sed -e 's/Rails //g'`.strip
ENV['RAILS_VERSION']

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path(
  "../../sample/app_#{ENV['RAILS_VERSION']}/config/environment",
  __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'faker'
require "response_code_matchers"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.include ActiveSupport::Testing::Assertions
  config.include ResponseCodeMatchers

  config.render_views = false

  config.order = 'random'
end
