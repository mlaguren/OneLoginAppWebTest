Feature:  Admin grants privileges to user

Scenario:  New user gets assume privileges
Given I am on the new user page
When I create a new user
And I give the user "Assume Privileges"
Then the user has assume privileges


Scenario:  New user gets manage group

Scenario:  New user gets manage users

Scenario:  New user gets super user privileges

Scenario:  Existing user gets assume privileges

