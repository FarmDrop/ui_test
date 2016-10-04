Feature: A user with valid credential should be able to log in

Scenario: A user on log in page

Given I am on the home page 
When I attempt to log in with valid credential
Then I should be successful
