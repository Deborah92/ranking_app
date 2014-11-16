require 'spec_helper'

describe "dogs/index.html.erb" do
  it "display all dogs" do
    user = FactoryGirl.create(:user)
    assign(:dogs, [
        Dog.create!(name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001', user_id: user.id,
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg'))),
        Dog.create!(name: 'Fortunato Hautacuperche', sex: 'male', birth_date: '01/02/2007', user_id: user.id,
                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg')))
    ])
    render
    expect(rendered).to match /class="table table-hover table-striped"/
    expect(rendered).to match /class="dog"/
    expect(rendered).to match /class="imageDog img-rounded"/
    expect(rendered).to match /class="glyphicon glyphicon-plus link"/
  end
end
