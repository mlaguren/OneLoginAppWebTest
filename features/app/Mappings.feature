Feature:  Mappings

@firefox_box
Scenario: User cannot create a blank mapping

Given I am on the mappings page
When I try to create a blank mapping
Then I cannot create a blank mapping 

Scenario:  User Can Create A Mapping
Given I am on the mappings page
When I create a new mapping
Then the mapping is saved


