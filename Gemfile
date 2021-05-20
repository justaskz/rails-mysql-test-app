source 'https://rubygems.org'

ruby '~> 2.6'

gem 'bootsnap', '~> 1.4', require: false
gem 'lean_interactor'
gem 'mysql2', '~> 0.5.3'
gem 'puma', '~> 4.3.8'
gem 'rails', '~> 6.0.3.2'
gem 'redis', '~> 4.1.3'
gem 'sidekiq', '~> 6.0.3'
gem 'sidekiq-cron'
gem 'sidekiq-failures'
gem 'sidekiq-throttled'

group :development do
  gem 'better_errors'
  gem 'bullet'
  gem 'listen'
end

group :test do
  gem 'database_cleaner'
  gem 'mock_redis', '~> 0.22.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
end
