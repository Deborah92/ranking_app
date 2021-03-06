Given(/^there are the following results:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'exhibition' => :exhibition_id, 'award' => :award_id, 'dog' => :dog_id, 'status' => :status )
  table.hashes.each do |attributes|
    FactoryGirl.create(:result, attributes)
  end
end

Then /^I should see "([^"]*)" in the second file section$/ do |text|
  page.should have_css("#awards form-group:nth-child(2):contains('#{text}')")
end


Then /^I should see the admin results page$/ do
  page.current_path.should == admin_results_path
end

Then /^I should see the results page$/ do
  page.current_path.should == results_path
end

And /^I follow "([^\"]*)" link on the "([^\"]*)" row$/ do |link, row|
  within "tr:contains('#{ row }')" do
    click_link(link)
  end
end