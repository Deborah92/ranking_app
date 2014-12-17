require 'spec_helper'
include Devise::TestHelpers

describe "results/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display my results" do
    cahoot = FactoryGirl.create(:cahoot)
    exhibition = FactoryGirl.create(:exhibition)
    sign_in :user, cahoot
    subject { get :index }
  end
end