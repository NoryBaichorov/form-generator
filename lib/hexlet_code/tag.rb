# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(tag_name, tag_options)
      puts 'FROM TAG ===================================='
      puts tag_options.inspect

      inputs = Render.generate_inputs(tag_options.form_body[:inputs])
      submit = Render.generate_submit(tag_options.form_body[:submit])

      tag_attributes = tag_attributes(tag_options.form_body[:form_options])

      return "<#{tag_name}#{tag_attributes}>" if Render::SINGLE_TAGS.include?(tag_name)

      "<#{tag_name}#{tag_attributes}>#{inputs}#{yield if block_given?}#{submit}</#{tag_name}>"
    end

    def self.tag_attributes(options)
      options.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end
  end
end
