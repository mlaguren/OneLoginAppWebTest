Given(/^I am on the users page as an admin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users
end

When(/^I select a user that can be assumed$/) do
  FromUsersPage = UsersPage.new
  @selected_user = FromUsersPage.select_user
end

Then(/^I can successfully assume the user$/) do
  FromUserDetailPage = UserDetailPage.new
  FromUserDetailPage.assume_user(@selected_user)
  FromClientAppsPage = ClientAppsPage.new
end

Then(/^I can return back to admin$/) do
  FromCurrentPage = CurrentPage.new
  FromCurrentPage.select_revert_to_admin 
end
