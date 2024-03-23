# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # Class Tag
  class Tag
    def self.build(tag_name, options = {})
      attributes = options.each_with_object([]) do |obj, acc|
        k, v = obj
        acc << "#{k}=\"#{v}\""
      end

      "<#{tag_name} #{attributes.join(" ")}>"
    end
  end
end
