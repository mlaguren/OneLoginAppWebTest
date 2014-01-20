When(/^I set a password$/) do
  FromPasswordPage = PasswordPage.new
  FromPasswordPage.enter_new_password
end
