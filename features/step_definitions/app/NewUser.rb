Given(/^I am on the new user page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_Users

  FromUsersPage = UsersPage.new
  FromUsersPage.select_new_user

end

When(/^I create a new user$/) do
  new_user=User.new
  new_user.save_to_file(new_user,"#{$new_user_file}") 

  FromNewUserPage = NewUserPage.new
  FromNewUserPage.enter_basic_user(new_user)
  FromNewUserPage.click_save
  
  FromEditUserPage = EditUserPage.new
  FromEditUserPage.select_send_invitation_from_more_actions_menu

  invite = SendInvitation.new
  invite.verify_users_email(new_user.email)
  invite.send_invite

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

