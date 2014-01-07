Given(/^I have logged into OneLogin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as("", "")  
end

Given(/^I have been inactive for "(.*?)"$/) do |timeout|
  FromAppsPage = ClientAppsPage.new
  FromAppsPage.select_from_Settings_menu("Policies")

  FromPolicyPage = PoliciesPage.new
  FromPolicyPage.click_policy_by_name("Default Policy")

  FromEditPolicyPage = EditPoliciesPage.new
  FromEditPolicyPage.click_on("Session")
  FromEditPolicyPage.set_session_timeout(timeout)
  FromEditPolicyPage.save_policy
  
  sleep 5 
end

When(/^I launch an App$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I need to reauthenticate$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I authenticate with my credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am taken to my App$/) do
  pending # express the regexp above with the code you wish you had
end

