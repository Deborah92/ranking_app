#require 'spec_helper'
#
#describe "dogs/show.html.erb" do
#  after(:all) { DatabaseCleaner.clean_with(:truncation) }
#  it "displays dog details correctly" do
#    user = FactoryGirl.create(:user)
#    dog = Dog.create(name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001', user_id: user.id,
#                                    image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg')))
#    render tem"/dogs/show.html.erb"
#    expect(rendered).to match /class="imgDog img-thumbnail"/
#  end
#end
