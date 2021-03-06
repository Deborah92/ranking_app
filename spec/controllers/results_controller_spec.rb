require 'spec_helper'

describe ResultsController do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  let(:cahoot) { FactoryGirl.create(:cahoot) }

  let(:registered) { FactoryGirl.create(:user) }

  let(:exhibition) { FactoryGirl.create(:exhibition)}

  let(:award) { FactoryGirl.create(:award)}

  let(:dog) { FactoryGirl.create(:dog)}

  let(:valid_attributes) { {exhibition_id: exhibition, award_id: award, dog_id: dog}  }

  let(:valid_attributes2) { {exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Validated'}  }

  let(:valid_attributes3) { {exhibition_id: '1', award_id: '8', dog_id: '1', status: 'Rejected'}  }

  context 'Guest users about results' do

    before { @result =  FactoryGirl.create(:result) }

    it 'cannot access to the new action' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the create action' do
      expect { post :create, result: valid_attributes }.not_to change(Result, :count)
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the edit action' do
      get :edit, id: @result.to_param
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the update action' do
      put :update, {id: @result.to_param, result: valid_attributes}
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the delete action' do
      expect { delete :destroy, id: @result.to_param }.not_to change(Result, :count)
      response.should redirect_to(new_user_session_path)
    end


  end


  context 'Cahoot users about results' do

    before {
      @result =  FactoryGirl.create(:result)

      @result_validated = FactoryGirl.create(:result, valid_attributes2)

      @result_rejected = FactoryGirl.create(:result, valid_attributes3)

    }

    it 'can access to the new action' do
      sign_in(:user, cahoot)
      get :new
      response.should be_success
    end

    it "can access the create action" do
      sign_in(:user, cahoot)
      post :create, result: valid_attributes

      response.should redirect_to(results_path)
      flash[:notice].should eql("Result has been created. A message with the result's link has been sent to your email address")
    end

    it 'cannot access to the edit action' do
      sign_in(:user, cahoot)
      get :edit, id: @result.to_param
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that")
    end

    it 'cannot access to the update action' do
      sign_in(:user, cahoot)
      put :update, {id: @result.to_param, result: valid_attributes}
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that")
    end

    it 'can access to the delete action with results pending ' do
      sign_in(:user, cahoot)
      delete :destroy, id: @result.to_param
      response.should redirect_to(results_path)
      flash[:notice].should eql("Result has been deleted.")
    end

    it 'cannot access to the delete action with results validated ' do
      sign_in(:user, cahoot)
      expect { delete :destroy, id: @result_validated.to_param }.not_to change(Result, :count)
      response.should redirect_to(results_path)
    end

    it 'can access to the delete action with results rejected ' do
      sign_in(:user, cahoot)
      delete :destroy, id: @result_rejected.to_param
      response.should redirect_to(results_path)
      flash[:notice].should eql("Result has been deleted.")
    end

    it 'can access to the show action' do
      sign_in(:user, cahoot)
      get :show, id: @result.to_param
      response.should be_success
    end

    it 'can access to the index action' do
      sign_in(:user, cahoot)
      get :index
      response.should be_success
    end

  end


  context 'Registered users about results' do

    before {
      @result =  FactoryGirl.create(:result)

      @result_validated = FactoryGirl.create(:result, valid_attributes2)

      @result_rejected = FactoryGirl.create(:result, valid_attributes3)

    }

    it 'cannot access to the new action' do
      sign_in(:user, registered)
      get :new
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it "cannot access the create action" do
      sign_in(:user, registered)
      post :create, result: valid_attributes
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access to the edit action' do
      sign_in(:user, registered)
      get :edit, id: @result.to_param
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that")
    end

    it 'cannot access to the update action' do
      sign_in(:user, registered)
      put :update, {id: @result.to_param, result: valid_attributes}
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that")
    end

    it 'cannot access to the delete action with results pending ' do
      sign_in(:user, registered)
      delete :destroy, id: @result.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access to the delete action with results validated ' do
      sign_in(:user, registered)
      delete :destroy, id: @result.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access to the delete action with results rejected ' do
      sign_in(:user, registered)
      delete :destroy, id: @result_rejected.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'can access to the show action' do
      sign_in(:user, registered)
      get :show, id: @result.to_param
      response.should be_success
    end

    it 'can access to the index action' do
      sign_in(:user, registered)
      get :index
      response.should be_success
    end

  end

end