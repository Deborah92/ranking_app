require 'spec_helper'

describe UsersController do

  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  let(:registered) { FactoryGirl.create(:user) }
  let(:cahoot) { FactoryGirl.create(:cahoot) }
  let(:user2) { FactoryGirl.create(:user) }
  valid_attributes = {email: 'user2@example.com', password: "password", password_confirmation: "password",
                      image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg'))}

  context "registered users on themselves" do
    it 'can access the edit action' do
      sign_in(:user, registered)
      get :edit, id: registered.to_param
      response.should be_success
    end

    it 'can access the update action' do
      sign_in(:user, registered)
      put :update, {id: registered.to_param, user: valid_attributes}
      response.should redirect_to(user_path)
      flash[:notice].should eql("User has been updated.")
    end
  end

  context "cahoot users on themselves" do
    it 'can access the edit action' do
      sign_in(:user, cahoot)
      get :edit, id: cahoot.to_param
      response.should be_success
    end

    it 'can access the update action' do
      sign_in(:user, cahoot)
      put :update, {id: cahoot.to_param, user: valid_attributes}
      response.should redirect_to(user_path)
      flash[:notice].should eql("User has been updated.")
    end
  end

  context "registered users on other users" do
    { "index" => "get",
      "new" => "get",
      "create" => "post",
      "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, registered)
        send(method, action.dup, :id => registered.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that")
      end
    end

    it 'cannot access the edit action' do
      sign_in(:user, registered)
      get :edit, id: user2.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access the update action' do
      sign_in(:user, registered)
      put :update, {id: user2.to_param, user: valid_attributes}
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end
  end

  context "cahoot users on other users" do

    { "index" => "get",
      "new" => "get",
      "create" => "post",
      "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, cahoot)
        send(method, action.dup, :id => cahoot.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that")
      end
    end

    it 'cannot access the edit action' do
      sign_in(:user, cahoot)
      get :edit, id: user2.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access the update action' do
      sign_in(:user, cahoot)
      put :update, {id: user2.to_param, user: valid_attributes}
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end
  end

end
