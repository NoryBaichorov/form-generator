# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def read_fixture(file_name)
  File.read("#{__dir__}/fixtures/#{file_name}.html").gsub('\n', '')
end
