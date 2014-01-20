Feature:  Basic admin functionality

@zendesk
@29652

Scenario:  An admin can assume a user

Given I am on the users page
When I select a user that can be assumed
Then I have successfully assumed the user

