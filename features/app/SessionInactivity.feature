Feature:  Session Timeout

@zendesk-28845
@firefox_extension
Scenario:  After being inactive, I need to sign back in when launching an application

Given my session timeout is set for "1 minute"
  And I have been inactive for "1 minute"
When I launch an App
Then I need to reauthenticate
When I authenticate with my credentials
Then I am taken to my App
