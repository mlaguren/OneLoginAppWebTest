Given(/^I am on the apps page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
  FromClientAppsPage.edit_app

end

When(/^I edit an app$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can launch the app$/) do
  pending # express the regexp above with the code you wish you had
end

