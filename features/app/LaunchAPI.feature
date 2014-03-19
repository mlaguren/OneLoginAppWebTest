Feature:  Launch API

@selenium_chrome
Scenario:  Launch App with Short Name

Given I am on the launch page
When I launch the app by the short name
Then I am on my app

Scenario:  Launch A Specific App

Given I am on the launch page
When I launch the app by the app id
Then I am on my app

