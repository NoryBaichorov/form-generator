# frozen_string_literal: true

require_relative "test_helper"

# TestClass
class TestHexletCode < Minitest::Test
  def setup
    @build = ::HexletCode::Tag.build("input", type: "value", src: "path/to/dict")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    expected = "<input type=\"value\" src=\"path/to/dict\">"

    assert expected == @build
  end

  test_methods = TestHexletCode.new({}).methods.select { |method| method.start_with? "test_" }
  raise "TestHexletCode has not tests!" if test_methods.empty?
end
