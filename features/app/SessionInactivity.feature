Feature:  Users are signed out of OneLogin when inactive

@zendesk
@28845
Scenario:  After being inactive, I need to sign back in when launching an application

Given I have logged into OneLogin
  And I have been inactive for "1 minute"
When I launch an App
Then I need to reauthenticate
When I authenticate with my credentials
Then I am taken to my App
