Given(/^I delete a user with an apostrophe$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users

  FromUsersPage = UsersPage.new
  FromUsersPage.select_new_user
 
  new_user=User.new

  FromNewUserPage = NewUserPage.new
  FromNewUserPage.enter_user_with_apostrophe(new_user)
  FromNewUserPage.click_save
  
  FromUsersDetailPage = UsersDetailPage.new
  sleep 5
end

Then(/^the user is removed$/) do
  pending # express the regexp above with the code you wish you had
end
