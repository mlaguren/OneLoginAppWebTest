Given(/^I have logged into OneLogin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])  

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
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
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])
end

Then(/^I am taken to my App$/) do
  sleep 5 
  windows = page.driver.browser.window_handles
  if windows.length > 1
    focus = windows.last
    page.driver.browser.switch_to.window(focus)
  end
  page.should have_no_content("Invalid app ID")
  current_host.should_not include("onelogin")
  current_path.should_not == "/client/apps"
end

