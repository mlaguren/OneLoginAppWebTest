Given(/^I am on the users page as an admin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users
end

When(/^I select a user that can be assumed$/) do
  FromUsersPage = UsersPage.new
  @selected_user = FromUsersPage.select_user_to_assume
end

Then(/^I can successfully assume the user$/) do
#  FromUserDetailPage = UserDetailPage.new
#  FromUserDetailPage.assume_user(@selected_user)
#  FromClientAppsPage = ClientAppsPage.new
   FromEditUserPage = EditUserPage.new
   FromEditUserPage.select_assume_user_from_more_actions_menu
end

Then(/^I can return back to admin$/) do
  FromCurrentPage = CurrentPage.new
  FromCurrentPage.select_revert_to_admin(@selected_user)
end
