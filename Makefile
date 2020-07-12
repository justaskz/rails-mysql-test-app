test:
	@ bundle exec spring rspec

setup:
	@ bash scripts/setup

server:
	@ bash scripts/server

sidekiq:
	@ bash scripts/sidekiq

console:
	@ bash scripts/console
