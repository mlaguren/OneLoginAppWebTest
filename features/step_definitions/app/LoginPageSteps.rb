Given(/^I have logged into OneLogin$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])  
end

Given(/^I have been inactive for "(.*?)"$/) do |timeout|
  sleep 5
  FromAppsPage = ClientAppsPage.new
  FromAppsPage.select_from_Settings_menu("Policies")

  FromPolicyPage = PoliciesPage.new
  FromPolicyPage.click_policy_by_name("Default Policy")

  FromEditPolicyPage = EditPoliciesPage.new
  FromEditPolicyPage.click_on("Session")
  FromEditPolicyPage.set_session_timeout(timeout)
  FromEditPolicyPage.save_policy

  FromEditPolicyPage.go_to_home 
  session_sleep(timeout) 
  
end

When(/^I launch an App$/) do
  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_any_app
end

Then(/^I need to reauthenticate$/) do
  FromLoginPage.receive_inactivity_warning
end

When(/^I authenticate with my credentials$/) do
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])
  sleep 10
end

Then(/^I am taken to my App$/) do
  page.should have_no_content("Invalid app ID")
end

