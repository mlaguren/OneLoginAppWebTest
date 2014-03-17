Feature:  Import Users

@firefox_box
@admin
@NewUserCSV
Scenario:  An Admin Can Import A New User

Given I am on the users page as an admin
When I upload the csv file
Then the uploaded user is successfully uploaded

@NewUserGroupCSV
Scenario:  An Admin Can Import A New User To A Group
Given I want to import a user to a group
When I upload the csv file
Then the uploaded user is added to the correct group
