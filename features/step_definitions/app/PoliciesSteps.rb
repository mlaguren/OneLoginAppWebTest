Given(/^my session timeout is set for "(.*?)"$/) do |timeout|
  windows = page.driver.browser.window_handles
  $log.debug("#{windows.length}")
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.select_from_settings_menu("Policies")

  FromPolicyPage = PoliciesPage.new
  FromPolicyPage.click_policy_by_name("Default Policy")

  FromEditPolicyPage = EditPoliciesPage.new
  FromEditPolicyPage.click_on("Session")
  unless  FromEditPolicyPage.is_session_timeout_set_to(timeout)
    FromEditPolicyPage.set_session_timeout(timeout)
    FromEditPolicyPage.save_policy
  end
  FromEditPolicyPage.go_to_home
end
