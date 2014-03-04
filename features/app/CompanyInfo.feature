Feature:  As a customer, I can update company information

@sauce
@firefox_box
Scenario:  As a customer I can update my company information
Given I am on the Company Information Page
When I update my company information
Then my company information is updated

@sauce
@firefox_box
Scenario:  As a customer, I can update the account owner
Given I am on the Company Information Page
When I change the Account Owner

