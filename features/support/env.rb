require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'sauce'
require 'sauce/capybara'
require 'sauce/cucumber'
require 'yaml'
require 'rspec'
require 'rspec/expectations'

Dir.glob(File.join("./OneLogin-PageObjects", "**", "*.rb")).each do |file|
   require file
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :poltergeist
  config.run_server = false
  config.default_selector = :css
  config.app_host = "http://app.onelogin.com"
end

Sauce.config do |c|
  c[:browsers] = [["Windows 7", "Internet Explorer", "9"]]
  c[:name] = "OneLogin IE Extension"
  c[:prerun] = "https://app.onelogin.com/system/extensions/onelogin_ie.exe"
end

