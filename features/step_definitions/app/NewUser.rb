Given(/^I am on the new user page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users

  FromUsersPage = UsersPage.new
  FromUsersPage.select_new_user
  
end

When(/^I create a new user$/) do
  NewUser=User.new
  
  FromNewUserPage = NewUserPage.new
  FromNewUserPage.enter_basic_user(NewUser)
  FromNewUserPage.click_cancel  
  sleep 5
end

Then(/^the new user can log in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I import users$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the users are created$/) do
  pending # express the regexp above with the code you wish you had
end

