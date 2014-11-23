require 'spec_helper'
include Devise::TestHelpers

describe "admin/results/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display all results" do
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin
    assign(:results, [
        Result.create!(exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Validated'),
        Result.create!(exhibition_id: '1', award_id: '14', dog_id: '2', status: 'Pending')
    ])
    render :template => "admin/results/index.html.erb"
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="result"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end