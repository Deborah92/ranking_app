require 'spec_helper'

describe Admin::ResultsController do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  let(:admin){FactoryGirl.create(:admin)}

  let(:exhibition) { FactoryGirl.create(:exhibition)}

  let(:award) { FactoryGirl.create(:award)}

  let(:dog) { FactoryGirl.create(:dog)}

  let(:valid_attributes) { {exhibition_id: exhibition, award_id: award, dog_id: dog, status: 'Validated'}  }

  let(:valid_attributes2) { {exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Validated'}  }

  let(:valid_attributes3) { {exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Rejected'}  }

  context 'Admin users about results' do

    before {
      @result =  FactoryGirl.create(:result)

      @result_validated = FactoryGirl.create(:result, valid_attributes2)

      @result_rejected = FactoryGirl.create(:result, valid_attributes3)

    }

    it 'can access to the new action' do
      sign_in(:user, admin)
      get :new
      response.should be_success
    end

    it "can access the create action" do
      sign_in(:user, admin)
      post :create, result: valid_attributes
      response.should redirect_to(admin_results_path)
      flash[:notice].should eql("Result has been created.")
    end

    it 'can access to the edit action' do
      sign_in(:user, admin)
      get :edit, id: @result.to_param
      response.should be_success
    end

    it 'can access to the update action' do
      sign_in(:user, admin)
      put :update, {id: @result.to_param, result: valid_attributes3}
      response.should redirect_to(admin_results_path)
      flash[:notice].should eql("Result has been updated. A message with the result's link has been sent to user email address")
    end

    it 'can access to the delete action with results pending ' do
      sign_in(:user, admin)
      delete :destroy, id: @result.to_param
      response.should redirect_to(admin_results_path)
      flash[:notice].should eql("Result has been deleted.")
    end

    it 'can access to the delete action with results validated ' do
      sign_in(:user, admin)
      delete :destroy, id: @result_validated.to_param
      response.should redirect_to(admin_results_path)
      flash[:notice].should eql("Result has been deleted.")
    end

    it 'can access to the delete action with results rejected ' do
      sign_in(:user, admin)
      delete :destroy, id: @result_rejected.to_param
      response.should redirect_to(admin_results_path)
      flash[:notice].should eql("Result has been deleted.")
    end

    it 'can access to the show action' do
      sign_in(:user, admin)
      get :show, id: @result.to_param
      response.should be_success
    end

    it 'can access to the index action' do
      sign_in(:user, admin)
      get :index
      response.should be_success
    end

  end

end