Feature:  Basic set of functionality

@firefox_box
@firefox_extension
Scenario:  A User Can Launch An Application
Given I have logged into OneLogin
When I launch an App
Then I am taken to my App 

Scenario:  A User Can Toggle App View
Given I am on the apps page
When I toggle view
Then I can toggle back
