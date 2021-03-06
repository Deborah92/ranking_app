require 'spec_helper'
include Devise::TestHelpers

describe "exhibitions/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display all exhibitions" do
    cahoot = FactoryGirl.create(:cahoot)
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin
    assign(:exhibitions, [
        Exhibition.create!(name: 'Exhibition 1', date: '28/05/2015', type_id: '1'),
        Exhibition.create!(name: 'Exhibition 2', date: '28/05/2015', type_id: '2')
    ])
    render :template => "exhibitions/index.html.erb"
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="exhibition"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end