Feature:  Import Users

@firefox_box
@admin
@NewUserCSV
Scenario:  An Admin Can Import A New User

Given I am on the users page as an admin
When I upload the csv file
Then the uploaded user is successfully uploaded

@firefox_box
@admin
@DuplicateUserCSV
@OA-2626

Scenario:  An Admin Can Update User's Info Via CSV Import
Given I am on the users page as an admin
When I update an existing with using a CSV file
Then the user's information is updated

@firefox_box
@admin
@NewUserGroupCSV
Scenario:  An Admin Can Import A New User To A Group
Given I want to import a user to a group
When I upload the csv file
Then the uploaded user is added to the correct group
