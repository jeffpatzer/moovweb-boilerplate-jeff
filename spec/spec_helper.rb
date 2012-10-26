require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = "http://www.example.com"

include Capybara::DSL

RSpec.configure do |config|
  config.include Capybara::DSL
end
