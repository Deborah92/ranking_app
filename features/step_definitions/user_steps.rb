Given(/^there are the following users:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete('unconfirmed') == 'true'
    @user = User.create!(attributes)
    @user.update_attribute(:admin, attributes[:admin] == 'true')
    @user.update_attribute(:cahoot, attributes[:cahoot] == 'true')
    @user.confirm! unless unconfirmed
  end
end

Given(/^I am signed in as them$/) do
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
  })
end

Given(/^I am signed in as "(.*?)"$/) do |email|
  @user = User.find_by_email!(email)
  step("I am signed in as them")
end

#And /^I follow "([^\"]*)" on the "([^\"]*)" row$/ do |link, row|
#  within "tr:contains('#{ row }')" do
#    click_link(link)
#  end
#end

And (/"([^\"]*)" is not deleted$/) do |dog|
  @dog = Dog.find_by_name(dog)
end