Feature: A user tried to sign up with an existing user's details(email), shouldn't be successful
@wip
Scenario: A user on log in page

Given I am on the home page 
When I attempt to sign up with existing user's credential
Then I should not be successful to sign up
