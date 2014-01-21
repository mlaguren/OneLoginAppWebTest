Given(/^I am on the users page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users

  FromUsersPage = UsersPage.new
  FromUsersPage.select_user
  sleep 5
end

When(/^I select a user that can be assumed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I have successfully assumed the user$/) do
  pending # express the regexp above with the code you wish you had
end
