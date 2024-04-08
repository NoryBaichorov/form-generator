# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(tag_name, options = {})
      tag_options = build_tag_attributes(options)

      return "<#{tag_name}#{tag_options}>" if Render::SINGLE_TAGS.include?(tag_name)

      "<#{tag_name}#{tag_options}>#{yield if block_given?}</#{tag_name}>"
    end

    def self.build_tag_attributes(options)
      options.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end
  end
end
