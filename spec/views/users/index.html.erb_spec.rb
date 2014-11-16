require 'spec_helper'

describe "users/index.html.erb" do
  it "display all users" do
    user = FactoryGirl.create(:user)
    assign(:users, [
        User.create!(email: 'user3@example.com', password: "password", password_confirmation: "password",
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg'))),
        User.create!(email: 'user4@example.com', password: "password", password_confirmation: "password",
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg')))
    ])
    render :template => "users/index.html.erb", :locals => {:users => user}
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="user"/
    expect(rendered).to match /class="imgUser img-rounded"/
  end
end
