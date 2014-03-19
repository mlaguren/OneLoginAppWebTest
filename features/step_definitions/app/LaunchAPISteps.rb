Given(/^I am on the launch page$/) do
  visit('http://htmlpreview.github.io/?https://github.com/mlaguren/OneLoginAppWebTest/blob/master/launch.html')
   announce_selenium_cookies(Capybara.current_session.driver.browser)
end

When(/^I launch the app by the short name$/) do
  click_link('MeetUp App ID')
  FromLoginPage = LoginPage.new
  p cookies[:session_onelogin.com]
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])
   announce_selenium_cookies(Capybara.current_session.driver.browser)
  sleep 5
end

Then(/^I am on my app$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I launch the app by the app id$/) do
  pending # express the regexp above with the code you wish you had
end

