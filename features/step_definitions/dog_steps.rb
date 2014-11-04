Given(/^there are the following dogs:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'Sex' => :sex, 'Titles' => :titles, 'Name' => :name, 'Birth Date' => :birth_date,
                      'Owner' => :user, 'Image' => :image )
  table.hashes.each do |hash|
    hash[:user] = User.find_by_email(hash[:user])
    FactoryGirl.create(:dog, hash)
  end
end

Given(/^"(.*?)" is the owner of the following dogs:$/) do |email, table|
  # table is a Cucumber::Ast::Table
  table.map_headers!( 'Sex' => :sex, 'Titles' => :titles, 'Name' => :name, 'Birth Date' => :birth_date,
                      'Image' => :image )
  table.hashes.each do |attributes|
    attributes.merge!(user: User.find_by_email(email))
    #Dog.create!(attributes)
    FactoryGirl.create(:dog, attributes)
  end
end

And (/^I click in "Birth date"/) do
  find("[@id='datepicker']").click
end
