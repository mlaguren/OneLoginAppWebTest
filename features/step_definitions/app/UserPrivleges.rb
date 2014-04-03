When(/^I create a new user$/) do
  new_user = User.new
  new_user.save_to_file(new_user,"new_user.txt")

  FromNewUserPage = NewUserPage.new
  FromNewUserPage.enter_basic_user(new_user)
  FromNewUserPage.click_save
end

When(/^I give the user "(.*?)"$/) do |privilege|
  FromUserPage = UserPage.new
  FromUserPage.add_privilege(privilege)  
  sleep 5
end

Then(/^the user has assume privileges$/) do
  list = Privileges.new
  list.entries.should include("Assume users")
end
