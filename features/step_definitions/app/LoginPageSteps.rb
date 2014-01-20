Given(/^I have logged into OneLogin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])  

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
  sleep 5
end

Given(/^I have been inactive for "(.*?)"$/) do |timeout|
  session_sleep(timeout) 
end

When(/^I launch an App$/) do
  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_any_app
end

Then(/^I need to reauthenticate$/) do
  FromLoginPage.receive_inactivity_warning
end

When(/^I authenticate with my credentials$/) do
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])
  sleep 10
end

Then(/^I am taken to my App$/) do
  page.should have_no_content("Invalid app ID")
end

