require 'spec_helper'
include Devise::TestHelpers

describe "results/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display my results" do
    cahoot = FactoryGirl.create(:cahoot)
    sign_in :user, cahoot
    assign(:results, [
        Result.create!(exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Validated'),
        Result.create!(exhibition_id: '1', award_id: '14', dog_id: '2', status: 'Pending')
    ])
    render :template => "results/index.html.erb"
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="result"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end