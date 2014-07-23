require 'spec_helper'

describe DogsController do

  let(:user) { FactoryGirl.create(:user) }

  context 'Guest users (not logged-in users)' do
    let(:valid_attributes) { {name: 'Samba y Fatiga Idilio', sex: 'male', birth_date: '01/01/2001',
                              user_id: user.id}  }

    it 'cannot access to the new action' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'cannot access to the create action' do
      post :create, dog: valid_attributes
      #expect { post :create, dog: valid_attributes }.not_to change(Dog, :count)
      response.should redirect_to(new_user_session_path)
    end
  end
end
