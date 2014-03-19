Given(/^I am on the launch page$/) do
  visit('http://htmlpreview.github.io/?https://github.com/mlaguren/OneLoginAppWebTest/blob/master/launch.html')
end

When(/^I launch the app by the short name$/) do
  click_link('MeetUp Short Name')
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])
end

Then(/^I am on my app$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I launch the app by the app id$/) do
  pending # express the regexp above with the code you wish you had
end

