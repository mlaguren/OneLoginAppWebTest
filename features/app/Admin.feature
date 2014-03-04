Feature:  Basic admin functionality

@zendesk-29652
@jira-2274
@firefox_box
@sauce
@admin
Scenario:  An admin can assume a user

Given I am on the users page as an admin
When I select a user that can be assumed
Then I can successfully assume the user
  And I can return back to admin

