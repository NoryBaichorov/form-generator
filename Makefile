install:
	bundle install
lint:
	bundle exec rubocop
.PHONY: test
test:
	ruby test/test_hexlet_code.rb