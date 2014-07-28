require 'spec_helper'

describe DogsController do

  let(:user) { FactoryGirl.create(:user) }

  context 'Guest users (not logged-in users)' do
    let(:valid_attributes) { {name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001',
                              user_id: user.id}  }

    before { @dog =  FactoryGirl.create(:dog) }

    it 'cannot access to the new action' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the create action' do
      post :create, dog: valid_attributes
      #expect { post :create, dog: valid_attributes }.not_to change(Dog, :count)
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
      #dog = Dog.create! valid_attributes
      expect { delete :destroy, id: @dog.to_param }.not_to change(Dog, :count)
      response.should redirect_to(new_user_session_path)
    end
  end
end
