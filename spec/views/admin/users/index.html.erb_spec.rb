require 'spec_helper'

describe "admin/users/index.html.erb" do
  it "display all users" do
    user = FactoryGirl.create(:admin)
    assign(:users, [
        User.create!(email: 'user5@example.com', password: "password", password_confirmation: "password",
                     image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg'))),
        User.create!(email: 'user6@example.com', password: "password", password_confirmation: "password",
                     image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg')))
    ])
    render :template => "admin/users/index.html.erb", :locals => {:users => user}
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="user"/
    expect(rendered).to match /class="imgUser img-rounded"/
    expect(rendered).to match /class="glyphicon glyphicon-user link"/
  end

end
