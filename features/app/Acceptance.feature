Feature:  Basic set of functionality

@firefox_box
@firefox_extension
Scenario:  A User Can Launch An Application
Given I have logged into OneLogin
When I launch an App
Then I am taken to my App 

@admin
Scenario:  An Admin Can Edit An Existing App

Given I have logged inot OneLogin
When I edit a company app

