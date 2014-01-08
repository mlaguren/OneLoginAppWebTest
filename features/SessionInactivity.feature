Feature:  Users are signed out of OneLogin when inactive

@zendesk
@sauce
Scenario:  After being inactive, I need to sign back in when launching an application

Given I have logged into OneLogin
  And I have been inactive for "2 hours"
When I launch an App
Then I need to reauthenticate
When I authenticate with my credentials
Then I am taken to my App
