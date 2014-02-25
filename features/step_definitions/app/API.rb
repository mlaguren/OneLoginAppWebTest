Given(/^I have an api key$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
 
  FromClientAppsPage.select_from_settings_menu('API')
  FromAPIPage = APIPage.new
  @api_key = FromAPIPage.get_api_key
end

When(/^I call all the users in my account$/) do
  c = Curl::Easy.new("https://app.onelogin.us/api/v2/users.xml")
  c.http_auth_types = :basic
  c.username = "#{@api_key}"
  c.password = "x"
  c.perform
  @message =  c.body_str
end

Then(/^I receive all the users in my account$/) do
  ap "#{@message.encode(:xml => :attr)}"

end

Then(/^I do not receive an invalid login$/) do
  @message.should_not == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<error>\n  <message>API key is invalid or missing</message>\n  <code>invalid_or_missing_api_key</code>\n</error>\n"
end


Given(/^I have made an api call$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["user"]["email"], $SETUP["user"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in

  FromClientAppsPage.select_from_settings_menu('API')
  FromAPIPage = APIPage.new
  @api_key = FromAPIPage.get_api_key

  c = Curl::Easy.new("https://app.onelogin.us/api/v2/users.xml")
  c.http_auth_types = :basic
  c.username = "#{@api_key}"
  c.password = "x"
  c.perform
  @message =  c.body_str

end

When(/^I change my api key$/) do
  FromAPIPage = APIPage.new
  FromAPIPage.generate_new_api_key(@api_key)
  FromAPIPage.save_api_changes
  FromCurrentPage = CurrentPage.new
  FromCurrentPage.select_from_settings_menu('API')
  @new_key = FromAPIPage.get_api_key 
  p @new_key
end

Then(/^I get the same api call results$/) do
  c = Curl::Easy.new("https://app.onelogin.us/api/v2/users.xml")
  c.http_auth_types = :basic
  c.username = "#{@new_key}"
  c.password = "x"
  c.perform
  @new_message =  c.body_str
  @new_message.should == @message
end


