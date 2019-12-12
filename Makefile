test:
	@ bundle exec spring rspec --profile --

setup:
	@ bundle install
	@ bundle exec rails db:drop db:create db:setup
