Then(/^I am logged into the OneLogin application$/) do
  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
end
