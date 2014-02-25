# Before Scenario Hooks

# If a scenario is tagged with @admin, the admin user will be used in the scenario.

Before ('@admin') do

  $admin_user_file="admin.json"
  $user_type="admin"

end

Before ('@new_user') do
  $new_user_file="new_user.json"
  $user_type="user"
end

Before ('@zendesk') do |scenario|
  tags=scenario.source_tag_names
  p tags
end

Before ('@sauce, @selenium_chrome') do |scenario|
  tags=scenario.source_tag_names
  p tags
  if Socket.gethostname == 'Melvins-MacBook-Pro.local'
    tags.delete('@sauce')
  end
end

AfterStep do
  #show_me_the_cookies
#  sleep 5
end
