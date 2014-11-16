Given(/^there are the following points:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'year' => :year, 'type' => :type_id, 'award' => 'award_id', 'points' => :npoint )
  table.hashes.each do |attributes|
    FactoryGirl.create(:point, attributes)
  end
end