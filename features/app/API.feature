Feature:  As a OneLogin Customer, I can use OneLogin's API,
  so that I can develop applications and reports based on date in OneLogin

@sauce
@firefox_box
Scenario:  A Customer Is Able To Make An API Call
Given I have an api key
When I call all the users in my account
Then I do not receive an invalid login

@sauce
@firefox_box
Scenario: A Customer Is Able To Change Their API Key
Given I have made an api call
When I change my api key
Then I get the same api call results
