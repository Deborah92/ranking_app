require 'spec_helper'

describe "results/index.html.erb" do
  it "display my results" do
    user = FactoryGirl.create(:user)
    assign(:results, [
        Result.create!(exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Validated'),
        Result.create!(exhibition_id: '1', award_id: '14', dog_id: '2', status: 'Pending')
    ])
    render :template => "results/index.html.erb", :locals => {:results => user}
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="result"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end