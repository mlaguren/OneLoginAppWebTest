When(/^I upload users$/) do
  FromUsersPage = UsersPage.new
  FromUsersPage.select_import_users_from_more_actions_menu

  FromImportUsersPage = ImportUsersPage.new
  FromImportUsersPage.upload_csv
end

Then(/^the uploaded users are successfully imported$/) do
  find(:id, 'flashnotice').text.should == 'Users successfully imported'
end
