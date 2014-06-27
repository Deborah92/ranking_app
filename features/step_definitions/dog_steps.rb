Given(/^there are the following dogs:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'Sex' => :sex, 'Titles' => :titles, 'Name' => :name, 'Birth Date' => :birth_date )
  table.hashes.map{ |hash| FactoryGirl.create(:dog, hash) }
end