require 'spec_helper'
include Devise::TestHelpers

describe "admin/results/index.html.erb" do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }
  it "display all results" do
    admin = FactoryGirl.create(:admin)
    exhibition = FactoryGirl.create(:exhibition)
    sign_in :user, admin
    subject { get :index }
  end
end