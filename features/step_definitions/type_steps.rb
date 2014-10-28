Given(/^there are the following types:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'name' => :name )
  table.hashes.each do |attributes|
    FactoryGirl.create(:type, attributes)
  end
end