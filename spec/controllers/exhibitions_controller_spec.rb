require 'spec_helper'

describe ExhibitionsController do

  let(:user) { FactoryGirl.create(:user) }

  let(:valid_attributes) { {name: 'Exhibition 1', date: '28/05/2015', type: 'B.I.S.'}  }

  context 'Guest users about exhibitions' do

    before { @exhibition =  FactoryGirl.create(:exhibition) }

    it 'cannot access to the new action' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the create action' do
      expect { post :create, exhibition: valid_attributes }.not_to change(Exhibition, :count)
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the edit action' do
      get :edit, id: @exhibition.to_param
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the update action' do
      put :update, {id: @exhibition.to_param, exhibition: valid_attributes}
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the delete action' do
      expect { delete :destroy, id: @exhibition.to_param }.not_to change(Exhibition, :count)
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the show action' do
      get :show, id: @exhibition.to_param
      response.should be_success
    end

    it 'cannot access to the index action' do
      get :index
      response.should be_success
    end

  end

  context 'Standard users about exhibitions' do

    before { @exhibition =  FactoryGirl.create(:exhibition) }

    it 'cannot access to the new action' do
      sign_in(:user, user)
      get :new
      response.should redirect_to(root_path)
    end

    it 'cannot access to the create action' do
      sign_in(:user, user)
      expect { post :create, exhibition: valid_attributes }.not_to change(Exhibition, :count)
      response.should redirect_to(root_path)
    end

    it 'cannot access to the edit action' do
      sign_in(:user, user)
      get :edit, id: @exhibition.to_param
      response.should redirect_to(root_path)
    end

    it 'cannot access to the update action' do
      sign_in(:user, user)
      put :update, {id: @exhibition.to_param, exhibition: valid_attributes}
      response.should redirect_to(root_path)
    end

    it 'cannot access to the delete action' do
      sign_in(:user, user)
      expect { delete :destroy, id: @exhibition.to_param }.not_to change(Exhibition, :count)
      response.should redirect_to(root_path)
    end

    it 'cannot access to the show action' do
      sign_in(:user, user)
      get :show, id: @exhibition.to_param
      response.should be_success
    end

    it 'cannot access to the index action' do
      sign_in(:user, user)
      get :index
      response.should be_success
    end

  end


  context 'Admin users about exhibitions' do

    before { @exhibition =  FactoryGirl.create(:exhibition) }
    let(:admin){FactoryGirl.create(:admin)}

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
      post :create, exhibition: valid_attributes
      response.should redirect_to(Exhibition.find_by_name('Exhibition 1'))
      flash[:notice].should eql("Exhibition has been created.")
    end

    it "can access the edit action" do
      sign_in(:user, admin)
      get :edit, id: @exhibition.to_param
      response.should be_success
    end

    it "can access the update action" do
      sign_in(:user, admin)
      put :update, {id: @exhibition.to_param, exhibition: valid_attributes}
      response.should redirect_to(exhibition_path(@exhibition))
      flash[:notice].should eql("Exhibition has been updated.")
    end

    it "can access the show action" do
      sign_in(:user, admin)
      get :show, id: @exhibition.to_param
      response.should be_success
    end

    it "cann access the destroy action" do
      sign_in(:user, admin)
      delete :destroy, id: @exhibition.to_param
      response.should redirect_to(exhibitions_path)
      flash[:notice].should eql("Exhibition has been deleted.")
    end

  end

end
