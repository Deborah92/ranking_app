require 'spec_helper'

describe DogsController do

  let(:user) { FactoryGirl.create(:user) }

  let(:valid_attributes) { {name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001', user_id: user.id,
                            image: File.open(File.join(Rails.root, 'spec/support/attachments/images/dog/perro.jpeg'))}  }


  context 'Guest users (not logged-in users)' do

    before { @dog =  FactoryGirl.create(:dog) }

    it 'cannot access to the new action' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the create action' do
      expect { post :create, dog: valid_attributes }.not_to change(Dog, :count)
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the edit action' do
      get :edit, id: @dog.to_param
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the update action' do
      put :update, {id: @dog.to_param, dog: valid_attributes}
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the delete action' do
      expect { delete :destroy, id: @dog.to_param }.not_to change(Dog, :count)
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the show action' do
      get :show, id: @dog.to_param
      response.should be_success
    end

    it 'cannot access to the index action' do
      get :index
      response.should be_success
    end
  end

  context 'Non-creator users (logged-in users)' do

    let(:hacker) { FactoryGirl.create(:user) }

    before do
      @dog = FactoryGirl.create(:dog)
      sign_in(:user, hacker)
    end

    it 'cannot access to the edit action' do
      get :edit, id: @dog.to_param
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access to the update action' do
      put :update, {id: @dog.to_param, dog: valid_attributes}
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

    it 'cannot access to the delete action' do
      expect { delete :destroy, id: @dog.to_param }.not_to change(Dog, :count)
      response.status.should == 403
      response.should render_template(file: "#{Rails.root}/public/403.html")
    end

  end

end
