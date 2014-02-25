Feature:  Adding new user's to OneLogin App

@sauce
@new_user
Scenario:  Admin add new user from new user page

Given I am on the new user page
When I create and invite the new user
Then the new user receives the OneLogin invite
