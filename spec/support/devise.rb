#
# Manning Rails 3 in Action (Section 7.3, Listing 7.6)
#
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
