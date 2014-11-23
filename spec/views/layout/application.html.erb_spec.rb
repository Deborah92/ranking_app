require 'spec_helper'
include Devise::TestHelpers

describe "layouts/application.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display application" do
    cahoot = FactoryGirl.create(:cahoot)
    admin = FactoryGirl.create(:admin)
    sign_in :user, cahoot
    assign(:dogs, [
        Dog.create!(name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001', user_id: cahoot.id,
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg'))),
        Dog.create!(name: 'Fortunato Hautacuperche', sex: 'male', birth_date: '01/02/2007', user_id: admin.id,
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg')))
    ])
    render :template => "layouts/application.html.erb"
    expect(rendered).to match /class="page"/
    expect(rendered).to match /class="navbar navbar-default navbar-fixed-top"/
    expect(rendered).to match /class="container-fluid bigBar"/
    expect(rendered).to match /id="bar"/
    expect(rendered).to match /class="container"/
    expect(rendered).to match /id="header1"/
    expect(rendered).to match /class="navbar-header"/
    expect(rendered).to match /class="navbar-brand aefrbf"/
    expect(rendered).to match /id="header2"/
    expect(rendered).to match /class="collapse navbar-collapse"/
    expect(rendered).to match /id="menu"/
    expect(rendered).to match /class="nav navbar-nav"/
    expect(rendered).to match /class="textHeader"/
    expect(rendered).to match /class="navbar-text navbar-right textSign"/
    expect(rendered).to match /class="msg"/
    expect(rendered).to match /id="gif"/
  end
end