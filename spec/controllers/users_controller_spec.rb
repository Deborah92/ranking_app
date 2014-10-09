require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }

  context "standard users" do
    it 'cannot access the new action' do
      sign_in(:user, user)
    end
  end

end
