require 'spec_helper'

describe Admin::UsersController do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  let(:user){ FactoryGirl.create(:user) }
  valid_attributes = {email: 'user2@example.com', password: "password", password_confirmation: "password",
                      image: File.open(File.join(Rails.root, 'spec/support/attachments/images/user/user.jpeg'))}
  let(:admin){FactoryGirl.create(:admin)}

  context "admin user actions on himself" do
    it "can access the edit action" do
      sign_in(:user, admin)
      get :edit, id: admin.to_param
      response.should be_success
    end

    it "can access the update action" do
      sign_in(:user, admin)
      put :update, {id: admin.to_param, user: valid_attributes}
      response.should redirect_to(admin_user_path)
      flash[:notice].should eql("User has been updated.")
    end

    it "can access the show action" do
      sign_in(:user, admin)
      get :show, id: admin.to_param
      response.should be_success
    end

    it "cannot access the destroy action" do
      sign_in(:user, admin)
      delete :destroy, id: admin.to_param
      response.should redirect_to(admin_users_path)
      flash[:alert].should eql("You cannot delete yourself")
    end
  end

  context "admin user actions on other users" do
    it "can access the index action" do
      sign_in(:user, admin)
      get :index
      response.should be_success
    end

    it "can access the new action" do
      sign_in(:user, admin)
      get :new
      response.should be_success
    end

    it "can access the create action" do
      sign_in(:user, admin)
      post :create, user: valid_attributes
      response.should redirect_to(admin_users_path)
      flash[:notice].should eql("User has been created.")
    end

    it "can access the edit action" do
      sign_in(:user, admin)
      get :edit, id: user.to_param
      response.should be_success
    end

    it "can access the update action" do
      sign_in(:user, admin)
      put :update, {id: user.to_param, user: valid_attributes}
      response.should redirect_to(admin_user_path)
      flash[:notice].should eql("User has been updated.")
    end

    it "can access the show action" do
      sign_in(:user, admin)
      get :show, id: user.to_param
      response.should be_success
    end

    it "cann access the destroy action" do
      sign_in(:user, admin)
      delete :destroy, id: user.to_param
      response.should redirect_to(admin_users_path)
      flash[:notice].should eql("User has been deleted.")
    end
  end



end
