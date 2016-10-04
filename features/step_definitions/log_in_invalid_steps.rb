When(/^I attempt to log in with invalid credential$/) do
  login('a@b.com','lalala')
end

Then(/^I should not be successful$/) do
  page.assert_text('Error Invalid email or password.')
end
