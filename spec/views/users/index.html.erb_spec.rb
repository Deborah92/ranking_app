require 'spec_helper'
include Devise::TestHelpers

describe "users/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display all users" do
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin
    assign(:users, [
        User.create!(email: 'user12@example.com', password: "password", password_confirmation: "password",
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg'))),
        User.create!(email: 'user13@example.com', password: "password", password_confirmation: "password",
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg')))
    ])
    render :template => "users/index.html.erb"
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="user"/
    expect(rendered).to match /class="imgUser img-rounded"/
  end
end
