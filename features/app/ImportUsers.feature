Feature:  Import Users

@firefox_box
@admin
Scenario:  An Admin Can Import Users

Given I am on the users page as an admin
When I upload users
Then the uploaded users are successfully imported
