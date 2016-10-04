Feature: A user should be able to sign up providing valid details 

Scenario: A user on log in page

Given I am on the home page 
When I attempt to sign up
Then I should be successful to sign up
