# frozen_string_literal: true

module HexletCode
  class Render
    def self.render_form(form)
      HexletCode::Tag.build('form', form.form_body[:form_options],
                            form.form_body[:inputs],
                            form.form_body[:submit])
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

    def self.tag_options(options)
      options.map do |key, value|
        " #{key}=\"#{value}\""
      end.to_a.join
    end
  end
end
