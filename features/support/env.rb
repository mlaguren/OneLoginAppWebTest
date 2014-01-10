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

$SETUP = YAML::load(File.open("config/environments/#{ENV['ENVIRONMENT']}"))

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.register_driver :firefox_extension do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension "/Users/melvinlaguren/Library/Application Support/Firefox/Profiles/xyw27iae.default/extensions/extension@onelogin.com.xpi"
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :poltergeist
  config.run_server = false
  config.default_selector = :css
  config.app_host = "http://app.onelogin.com"
end

Capybara.register_driver :sauce_firefox do 
  caps = Selenium::WebDriver::Remote::Capabilities.firefox
  caps.platform = "Windows XP"
  caps.version = "3.6"
end

Sauce.config do |c|
  c[:browsers] = [["Windows 7", "Firefox", "24"]]
  c[:name] = "Regression"
  c[:prerun] = "https://app.onelogin.com/system/extensions/onelogin.xpi"
end

