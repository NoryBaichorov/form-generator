# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br input img].freeze

    def self.build(tag_name, options = {}, inputs = [], submit = {})
      inputs = Render.generate_inputs(inputs)
      submit = Render.generate_submit(submit)
      tag_options = Render.tag_options(options)

      return "<#{tag_name}#{tag_options}>" if SINGLE_TAGS.include?(tag_name)

      "<#{tag_name}#{tag_options}>#{inputs}#{yield if block_given?}#{submit}</#{tag_name}>"
    end
  end
end
