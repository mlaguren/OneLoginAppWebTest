When(/^I upload the csv file$/) do
  FromUsersPage = UsersPage.new
  FromUsersPage.select_import_users_from_more_actions_menu

  FromImportUsersPage = ImportUsersPage.new
  FromImportUsersPage.upload_csv
end

Then(/^the uploaded user is successfully uploaded$/) do
  find(:xpath, ".//*[@id='flashnotice']//*[@class='container']").text.should == 'Users successfully imported'

  FromImportPage = ImportUsersPage.new
  FromImportPage.select_from_users_menu('All Users')
  
  FromAllUsersPage = AllUsersPage.new
  
  $log.debug("Searching for #{$new_user_csv.full_name}")
  FromAllUsersPage.search_by_name($new_user_csv.full_name)
  FromAllUsersPage.returns_one_user($new_user_csv.full_name)
end

Given(/^I want to import a user to a group$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])
  
  FromClientAppsPage=ClientAppsPage.new
  FromClientAppsPage.select_from_users_menu("Groups")

  FromGroupsPage=GroupsPage.new
  FromGroupsPage.verify_group('Import Group')

  FromGroupsPage.select_from_users_menu('All Users')
end

Then(/^the uploaded user is added to the correct group$/) do
  find(:xpath, ".//*[@id='flashnotice']//*[@class='container']").text.should == 'Users successfully imported'

  FromImportPage = ImportUsersPage.new
  FromImportPage.select_from_users_menu('All Users')

  FromAllUsersPage = AllUsersPage.new
  FromAllUsersPage.search_by_name($new_user_to_group_csv.full_name)
  FromAllUsersPage.select_user($new_user_to_group_csv.full_name)
  FromUsersPage.member_of_group('Import Group')
end

When(/^I update an existing with using a CSV file$/) do
  FromUsersPage = UsersPage.new
  sleep 1
  FromUsersPage.select_import_users_from_more_actions_menu

  FromImportUsersPage = ImportUsersPage.new
  FromImportUsersPage.upload_csv

  update_name_in_csv

  FromImportUsersPage.upload_csv

end

Then(/^the user's information is updated$/) do
  find(:id, 'flashnotice').text.should == 'Users successfully imported'

  FromImportPage = ImportUsersPage.new
  FromImportPage.select_from_users_menu('All Users')

  FromAllUsersPage = AllUsersPage.new
  FromAllUsersPage.search_by_email($dupe_user_csv.email)
  FromAllUsersPage.verify_single_user($dupe_user_csv.email)
  FromAllUsersPage.select_user($dupe_user_csv.full_name)
end

Then(/^the csv file fails to load$/) do
  FromImportUsersPage.failed_to_upload_message
  FromImportUsersPage.display_reason
end
