Feature:  Admin grants privileges to user

@firefox_box
@OA-2578
Scenario:  New user gets assume privileges
Given I am on the new user page
When I create a new user
And I give the user "Assume users"
Then the user has assume privileges


Scenario:  New user gets manage group

Scenario:  New user gets manage users

Scenario:  New user gets super user privileges

Scenario:  Existing user gets assume privileges


