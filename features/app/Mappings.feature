Feature:  Mappings

@firefox_box
Scenario: User cannot create a blank mapping

Given I am on the Mappings Page
When I try to create a blank mapping
Then I cannot create a blank mapping 
