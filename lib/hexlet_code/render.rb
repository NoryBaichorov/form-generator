# frozen_string_literal: true

module HexletCode
  class Render
    SINGLE_TAGS = %w[br input img].freeze

    def self.render_form(form)
      form_body = form.form_body

      inputs = generate_inputs(form_body[:inputs])
      submit = generate_submit(form_body[:submit])

      HexletCode::Tag.build('form', form_body[:form_options]) { "#{inputs}#{submit}" }
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
