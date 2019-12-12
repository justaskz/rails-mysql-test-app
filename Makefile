test:
	@ bundle exec spring rspec

test_profile:
	@ bundle exec spring rspec --profile --

db_setup:
	@ bundle install
	@ bundle exec rails db:drop db:create db:setup

db_reset:
	@ bundle exec rails db:drop db:create db:setup

db_migrate:
	@ bundle exec rails db:migrate
	@ bundle exec rails db:migrate RAILS_ENV=test

server:
	@ bundle exec rails server

sidekiq:
	@ bundle exec sidekiq

console:
	@ bundle exec rails console
