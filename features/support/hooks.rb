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

Before do |scenario|
  ap scenario.feature.title
  Dir.mkdir('scenarios') unless File.exists?('scenarios')
  logfile=scenario.name.gsub(/\s+/, "")
  $log=Logger.new("scenarios/#{logfile}.log")
  $log.debug("Start:  #{scenario.name}")
  
  window_count = page.driver.browser.window_handles
  $log.debug("#{window_count.length} window(s) open")
 
end

Before ('@sauce, @selenium_chrome') do |scenario|
  tags=scenario.source_tag_names
  p tags
  if Socket.gethostname == 'Melvins-MacBook-Pro.local'
    tags.delete('@sauce')
  end
end

Around('@fast') do |scenario, block|
  Timeout.timeout(360) do
    block.call
  end
end

After do |scenario|
  $log.debug("Status:  #{scenario.status}")
end
