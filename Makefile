install:
	bundle install
lint:
	bundle exec rubocop
.PHONY: test
test:
	cd test && ruby test_hexlet_code.rb