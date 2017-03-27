Feature: A user with invalid credential should not be able to log in

Scenario: A user on log in page

Given I am on the home page 
When I attempt to log in with invalid credential
Then I should not be successful
