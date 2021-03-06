# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'email_spec'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Configure VCR API playback testing
DUMMY_API_KEY = 'DUMMY_API_KEY'
ENV['BIBLESEARCH_API_KEY'] = DUMMY_API_KEY unless ENV.has_key?('BIBLESEARCH_API_KEY')
BIBLESEARCH_API_KEY = ENV['BIBLESEARCH_API_KEY']
API_KEY_TEMPLATE='<%= api_key %>'
CASSETTE_VARS = {api_key: BIBLESEARCH_API_KEY}
VCR_LOG_FILE='log/VCR.log'

# VCR loaded for every test makes full stack tests fail.
VCR.configure do |c|
  # BASIC CONFIGURATION
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.debug_logger = File.open(VCR_LOG_FILE, 'w')
  c.configure_rspec_metadata!
  # only VCR requests to bibles.org (stubbing the api)
  c.ignore_request  {|req| req.parsed_uri.host != 'bibles.org' }

  # DISABLE RECORDING UNLESS THERE'S API KEY IN THE ENV
  if BIBLESEARCH_API_KEY == DUMMY_API_KEY
    # don't record
    c.default_cassette_options = {:record => :none}
  else
    # we have an API key, might want to record
    c.default_cassette_options = {:record => :new_episodes}
  end

  #EXPUNGE SECRET KEYS
  #  when recording, transform secrets to a template
  c.filter_sensitive_data( API_KEY_TEMPLATE) { BIBLESEARCH_API_KEY }
  #  when playing, transform template into secrets
  c.default_cassette_options[:erb] = CASSETTE_VARS
end


RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
