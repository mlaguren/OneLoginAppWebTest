Given(/^I am on the mappings page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_from_users_menu("Mappings")
  
  FromMappingsPage = MappingsPage.new
  FromMappingsPage.create_new_mapping
end

When(/^I try to create a blank mapping$/) do
  FromNewMappingsPage = NewMappingsPage.new
  FromNewMappingsPage.create_blank_mapping
end

Then(/^I cannot create a blank mapping$/) do
  find(:id, 'flasherror').text.should == "Name can't be blank"
end

When(/^I create a new mapping$/) do
  FromNewMappingsPage = NewMappingsPage.new
  @mapping_name = FromNewMappingsPage.create_new_mapping
end

Then(/^the mapping is saved$/) do
  FromMappingsPage.mapping_is_enabled(@mapping_name)
end
