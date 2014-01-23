When(/^I sign up for a OneLogin trial account$/) do
  visit 'http://www.onelogin.com'
  
  FromHomePage = HomePage.new
  FromHomePage.go_to_sign_up
  
  FromSignUpPage = SignUpPage.new
  FromSignUpPage.register_new_company
#  FromSignUpPage.terms "agree"
#  FromSignUpPage.sign_up
end

