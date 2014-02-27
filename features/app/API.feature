Feature:  As a OneLogin Customer, I can use OneLogin's API, so that I can develop Apps that work with OneLogin

@firefox_box
Scenario:  A customer is able to make api calls
Given I have an api key
When I call all the users in my account
Then I do not receive an invalid login

@firefox_box
Scenario: A customer is able to change their api key
Given I have made an api call
When I change my api key
Then I get the same api call results
