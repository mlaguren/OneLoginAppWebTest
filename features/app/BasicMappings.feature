Feature:  Mappings

@firefox_box
Scenario: Admin Cannot Create A Blank Mapping

Given I am on the mappings page
When I try to create a blank mapping
Then I cannot create a blank mapping 

@firefox_box
Scenario:  Admin Can Create A Mapping
Given I am on the mappings page
When I create a new mapping
Then the mapping is saved


Scenario:  Admin Can Edit A Mapping

