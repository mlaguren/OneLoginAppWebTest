Given(/^I am on the Company Information Page$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromCurrentPage = CurrentPage.new
  FromCurrentPage.select_from_settings_menu("Company Info")
  current_path.should == "/accounts/owner/edit"
end

When(/^I update my company address$/) do
  new_co_info = Company.new
  @address = JSON.parse(new_co_info.to_json)
  FromCompanyPage = CompanyInfoPage.new
  FromCompanyPage.update_company_address(@address)
  FromCompanyPage.save_company_info
end

Then(/^my company address is updated$/) do
  FromCompanyPage.verify_address(@address)
end

When(/^I change the Account Owner$/) do
  pending # express the regexp above with the code you wish you had
end

