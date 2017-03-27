Given(/^I am on the home page$/) do
  visit ''
end

When(/^I attempt to log in with valid credential$/) do
  login(Configuration['user01'],Configuration['password'])
end

Then(/^I should be successful$/) do	
  page.assert_text(Configuration['name01'])
  logout
end
