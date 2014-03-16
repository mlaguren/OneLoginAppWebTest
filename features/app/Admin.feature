Feature:  Basic admin functionality

@sauce
@zendesk-29652
@jira-2274
@firefox_box
@admin
Scenario:  An Administrator Can Assume A Non Admin User 

Given I am on the users page as an admin
When I select a user that can be assumed
Then I can successfully assume the user
  And I can return back to admin

