# frozen_string_literal: true

module HexletCode
  module Inputs
    # Class TextInput
    class TextInput < BaseInput
      COLS = 20
      ROWS = 40

      def self.build(options, value)
        options[:cols] = COLS unless options.key?(:cols)
        options[:rows] = ROWS unless options.key?(:rows)

        textarea = HexletCode::Tag.build("textarea", options) { value }

        label(options[:name]) + textarea
      end
    end
  end
end
