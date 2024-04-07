# frozen_string_literal: true

module HexletCode
  class Render
    SINGLE_TAGS = %w[br input img].freeze

    def self.render_form(form)
      puts 'FROM RENDER ============================='
      puts form.inspect

      HexletCode::Tag.build('form', form)
    end

    def self.generate_submit(submit)
      HexletCode::Tag.build('input', submit[:options]) unless submit[:options].nil?
    end

    def self.generate_inputs(inputs)
      inputs.map do |input|
        input_name = input[:field_type].empty? ? 'String' : input[:field_type].capitalize

        "HexletCode::Inputs::#{input_name}Input".constantize.build(input[:options], input[:value])
      end.join
    end
  end
end
