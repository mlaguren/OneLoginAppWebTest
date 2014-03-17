Given(/^I am on the Groups Page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
  FromClientAppsPage.select_from_users_menu("Groups")
end

When(/^I create a Group$/) do
  FromGroupsPage = GroupsPage.new
  FromGroupsPage.create_new_group

  FromNewGroupsPage = NewGroupsPage.new
  @created_group = FromNewGroupsPage.enter_temporary_group_name
end

Then(/^the group is created$/) do
  FromGroupsPage.find_group(@created_group)
  sleep 5
end
