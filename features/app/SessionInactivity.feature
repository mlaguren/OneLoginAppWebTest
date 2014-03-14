Feature:  Session Timeout

@firefox_extension
@zendesk-28845
Scenario:  After being inactive, I need to sign back in when launching an application

Given my session timeout is set for "1 minute"
  And I have been inactive for "1 minute"
When I launch an App
Then I need to reauthenticate
When I authenticate with my credentials
Then I am taken to my App

@OA-1261-NewUI
@OA-2601-ClassicUI
Scenario:  After being inactive, :q
