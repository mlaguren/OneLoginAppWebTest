Feature:  New User

@new_user
Scenario:  New User Created From User Page

Given I am on the new user page
When I create and invite the new user
Then the new user receives the OneLogin invite
