require 'spec_helper'

describe UsersController do

  #let(:user) { FactoryGirl.create(:user) }
  valid_attributes = {email: 'user2@example.com', password: "password", password_confirmation: "password"}
  #@user = FactoryGirl.create(:user)

  context "standard users" do
    let(:user) { FactoryGirl.create(:user) }

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
  #context "standard users" do
  #  it 'cannot access the new action' do
  #    sign_in(:user, user)
  #    get :new
  #    response.should redirect_to(root_path)
  #    flash[:alert].should eql("You must be an admin to do that")
  #  end
  #
  #  it 'cannot access the create action' do
  #    sign_in(:user, user)
  #    expect { post :create, user: valid_attributes }.not_to change(User, :count)
  #    response.should redirect_to(root_path)
  #    flash[:alert].should eql("You must be an admin to do that")
  #  end
  #
  #  it 'cannot access the edit action of the other user' do   ##FALLA
  #    sign_in(:user, user)
  #    get :edit, id: @user.to_param
  #    response.should redirect_to(root_path)
  #    flash[:alert].should eql("You must be an admin to do that")
  #  end
  #
  #  it 'cannot access the update action' do                   ##FALLA
  #    sign_in(:user, user)
  #    put :update, {id: @user.to_param, user: valid_attributes}
  #    response.should redirect_to(root_path)
  #    flash[:alert].should eql("You must be an admin to do that")
  #  end
  #
  #
  #  it 'cannot access the delete action' do
  #    sign_in(:user, user)
  #    expect { delete :destroy, id: user.to_param }.not_to change(User, :count)
  #    response.should redirect_to(root_path)
  #    flash[:alert].should eql("You must be an admin to do that")
  #  end
  #end

end
