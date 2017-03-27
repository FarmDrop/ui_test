When(/^I attempt to sign up with existing user's credential$/) do
    signup(Configuration['user01'])
end

Then(/^I should not be successful to sign up$/) do
    page.assert_text('Email has already been taken')
end
