require 'coveralls'
Coveralls.wear!

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

ENV["APP_ENV"] ||= "test"

RSpec.configure do |config|
    config.include Rack::Test::Methods
    config.include Capybara::DSL
end

Capybara.app = ApplicationController
