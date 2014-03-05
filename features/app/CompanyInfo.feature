Feature: Company Info 

@firefox_box
Scenario:  A Customer Can Update Company Information
Given I am on the Company Information Page
When I update my company information
Then my company information is updated

@firefox_box
Scenario:  A Customer Can Update The Account Owner
Given I am on the Company Information Page
When I change the Account Owner

