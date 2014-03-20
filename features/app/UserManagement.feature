Feature:  Managing Users

@admin
@OA-2593
Scenario:  Delete A User With An Apostrophe In Name

Given I delete a user with an apostrophe
Then the user is removed
