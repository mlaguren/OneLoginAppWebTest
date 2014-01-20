# Before Scenario Hooks

# If a scenario is tagged with @admin, the admin user will be used in the scenario.
Before ('@admin') do

  $admin_user_file="admin.json"
  $user_type="admin"

end

Before ('@zendesk') do |scenario|
  tags=scenario.source_tag_names
  p tags
end
