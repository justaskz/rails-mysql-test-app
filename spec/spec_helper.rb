ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'sidekiq/testing'
require 'mock_redis'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.include FactoryBot::Syntax::Methods

  config.mock_with :rspec do |c|
    c.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: %w[ar_internal_metadata])
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start

    allow(Redis)
      .to receive(:new)
      .and_return(MockRedis.new)
  end

  config.after(:each) do
    DatabaseCleaner.clean
    Sidekiq::Worker.clear_all
  end
end
