# frozen_string_literal: true

module HexletCode
  # Class Form
  class Form
    attr_accessor :struct, :action, :method, :form_body

    def initialize(struct, **options)
      @struct = struct
      @action = options[:url] || "#"
      @method = options[:method] || "post"

      @form_body = {
        inputs: [],
        submit: { value: nil, options: nil },
        form_options: { action: action, method: method }.merge(options.except(:url, :method))
      }
    end

    def input(field_name, options = {})
      field_type = options.key?(:as) ? options[:as].to_s : ""
      new_options = options.except(:as)

      value = @struct.public_send(field_name)
      new_options[:name] = field_name

      @form_body[:inputs] << build_attributes(new_options, field_type, value)
    end

    def submit(value = "Save", options = {})
      new_options = { type: "submit", value: value }

      all_options = options.merge(new_options)

      @form_body[:submit] = { options: all_options }
    end

    def build_attributes(options, field_type, value)
      { options: options, field_type: field_type, value: value }
    end
  end
end
