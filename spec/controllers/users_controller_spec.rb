require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  valid_attributes = {email: 'user2@example.com', password: "password", password_confirmation: "password"}

  context "standard users on themselves" do
    it 'can access the edit action' do
      sign_in(:user, user)
      get :edit, id: user.to_param
      response.should be_success
    end

    it 'can access the update action' do
      sign_in(:user, user)
      put :update, {id: user.to_param, user: valid_attributes}
      response.should redirect_to(user_path)
      flash[:notice].should eql("User has been updated.")
    end
  end

  context "standard users on other users" do
    { "index" => "get",
      "new" => "get",
      "create" => "post",
      "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => user.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that")
      end
    end

    it 'cannot access the edit action' do
      sign_in(:user, user)
      get :edit, id: user2.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access the update action' do
      sign_in(:user, user)
      put :update, {id: user2.to_param, user: valid_attributes}
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end
  end

end
