# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RankingApp::Application.initialize!

RankingApp::Application.configure do
  config.action_mailer.default_url_options = { :host => 'localhost' }
end

