Then(/^I am logged into the OneLogin application$/) do
  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
end

When(/^I toggle view$/) do
  @view = FromClientAppsPage.toggle_view  
end

Then(/^I can toggle back$/) do
  FromClientAppsPage.switch_view_to(@view)
end
