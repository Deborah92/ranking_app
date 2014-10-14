require 'spec_helper'

describe Admin::UsersController do

  #describe "GET 'index'" do
  #  it "returns http success" do
  #    get 'index'
  #    response.should be_success
  #  end
  #end

  let(:user) { FactoryGirl.create(:user, :admin => true) }
  valid_attributes = {email: 'user2@example.com', password: "password", password_confirmation: "password"}

  context "admin user actions on himself" do

    it "can access the index action" do
      sign_in(:user, user)
      get :index
      response.should be_success
    end

    it "can access the new action" do
      sign_in(:user, user)
      get :new
      response.should be_success
    end

    it "can access the create action" do
      sign_in(:user, user)
      post :create, user: valid_attributes
      response.should redirect_to(admin_users_path)
      flash[:notice].should eql("User has been created.")
    end

    it "can access the edit action" do
      sign_in(:user, user)
      get :edit, id: user.to_param
      response.should be_success
    end

    #{ "index" => "get",
    #  "new" => "get",
    #  "create" => "post",
    #  "edit" => "get",
    #  "update" => "put",
    #  "destroy" => "delete" }.each do |action, method|
    #  it "cannot access the #{action} action" do
    #    sign_in(:user, user)
    #    send(method, action.dup, :id => user.id)
    #    response.should redirect_to(root_path)
    #    flash[:alert].should eql("You must be an admin to do that")
    #  end
    #end
  end

end
