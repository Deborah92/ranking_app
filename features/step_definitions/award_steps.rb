Given(/^there are the following awards:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'award' => :award )
  table.hashes.each do |attributes|
    FactoryGirl.create(:award, attributes)
  end
end