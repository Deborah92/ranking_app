Given(/^there are the following exhibitions:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'name' => :name, 'date' => :date, 'type' => :type_id )
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

Given(/^"(.*?)" is the result of the following exhibition:$/) do |exhibition, table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'exhibition' => :name, 'date' => :date, 'type' => :type_id )
  table.hashes.each do |attributes|
    #attributes.merge!(date: Result.find_by_exhibition_id(exhibition))
    #Dog.create!(attributes)
    FactoryGirl.create(:result, attributes)
  end
end
