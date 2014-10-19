Given(/^there are the following exhibitions:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    FactoryGirl.create(:exhibition, attributes)
  end
end

And (/^I click in "Date"/) do
  find("[@id='datepicker']").click
end

And /^I follow "([^\"]*)" on the "([^\"]*)" row$/ do |link, row|
  within "tr:contains('#{ row }')" do
    click_link(link)
  end
end