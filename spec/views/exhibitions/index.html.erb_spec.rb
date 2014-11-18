require 'spec_helper'

describe "exhibitions/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display all exhibitions" do
    user = FactoryGirl.create(:user)
    assign(:exhibitions, [
        Exhibition.create!(name: 'Exhibition 1', date: '28/05/2015', type_id: '1'),
        Exhibition.create!(name: 'Exhibition 2', date: '28/05/2015', type_id: '2')
    ])
    render :template => "exhibitions/index.html.erb", :locals => {:exhibitions => user}
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="exhibition"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end