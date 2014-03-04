Given(/^I have an api key$/) do
  FromLoginPage = LoginPage.new
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in
 
  FromClientAppsPage.select_from_settings_menu('API')
  FromAPIPage = APIPage.new
  @api_key = FromAPIPage.get_api_key
end

When(/^I call all the users in my account$/) do
  api_url="#{$SETUP['api']}v2/users.xml"
  p "#{api_url}"
  c = Curl::Easy.new(api_url)
  c.http_auth_types = :basic
  c.username = "#{@api_key}"
  c.password = "x"
  c.perform
  @message =  c.body_str
  p @message
  $log.debug("List of Users:  #{@message}")
end

Then(/^I receive all the users in my account$/) do
  ap "#{@message.encode(:xml => :attr)}"

end

Then(/^I do not receive an invalid login$/) do
  @message.should_not == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<error>\n  <message>API key is invalid or missing</message>\n  <code>invalid_or_missing_api_key</code>\n</error>\n"
end


Given(/^I have made an api call$/) do
  ap "Going To Home Page"
  FromLoginPage = LoginPage.new
  ap "Logging In"
  FromLoginPage.login_as($SETUP["admin"]["email"], $SETUP["admin"]["password"])

  ap "On client Page"
  FromClientAppsPage = ClientAppsPage.new
  FromClientAppsPage.user_is_logged_in

  FromClientAppsPage.select_from_settings_menu('API')
  FromAPIPage = APIPage.new
  @api_key = FromAPIPage.get_api_key
  ap @api_key

  api_url="#{$SETUP['api']}v2/users.xml"
  c = Curl::Easy.new("api_url")
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
end

Then(/^I get the same api call results$/) do
  sleep 2
  api_url="#{$SETUP['api']}v2/users.xml"
  c = Curl::Easy.new(api_url)
  c.http_auth_types = :basic
  c.username = "#{@new_key}"
  c.password = "x"
  c.perform
  @new_message =  c.body_str
  @new_message.should == @message
end


