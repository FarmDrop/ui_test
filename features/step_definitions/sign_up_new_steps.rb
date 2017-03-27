When(/^I attempt to sign up$/) do
  signup
end

Then(/^I should be successful to sign up$/) do
  page.assert_text('Account')
end
