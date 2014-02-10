Feature:  Adding new user's to OneLogin App

@new_user
@sauce
Scenario:  Admin add new user from new user page

Given I am on the new user page
When I create a new user
Then the new user can log in
