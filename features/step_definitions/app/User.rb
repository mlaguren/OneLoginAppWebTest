When(/^I upload the csv file$/) do
  FromUsersPage = UsersPage.new
  FromUsersPage.select_import_users_from_more_actions_menu

  FromImportUsersPage = ImportUsersPage.new
  FromImportUsersPage.upload_csv
end

Then(/^the uploaded user is successfully uploaded$/) do
  find(:id, 'flashnotice').text.should == 'Users successfully imported'

  FromImportPage = ImportUsersPage.new
  FromImportPage.select_from_users_menu('All Users')
  
  FromAllUsersPage = AllUsersPage.new
  
  $log.debug("Searching for #{$new_user_csv.full_name}")
  FromAllUsersPage.search_by_name($new_user_csv.full_name)
  FromAllUsersPage.returns_one_user($new_user_csv.full_name)
  sleep 5
end

Given(/^I want to import a user to a group$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])
  
  FromClientAppsPage=ClientAppsPage.new
  FromClientAppsPage.select_from_users_menu("Groups")

  FromGroupsPage=GroupsPage.new
  FromGroupsPage.verify_group('Import Group')

  FromGroupsPage.select_from_users_menu('All Users')
  sleep 5
end

Then(/^the uploaded user is added to the correct group$/) do
  find(:id, 'flashnotice').text.should == 'Users successfully imported'

  FromImportPage = ImportUsersPage.new
  FromImportPage.select_from_users_menu('All Users')

  FromAllUsersPage = AllUsersPage.new
  FromAllUsersPage.search_for_user_in_group('User Name', 'Import Group')
  sleep 5
end
