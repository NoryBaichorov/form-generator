# frozen_string_literal: true

require_relative "hexlet_code/version"
require "active_support/inflector"

# Module HexletCode
module HexletCode
  class Error < StandardError; end

  autoload :Tag, "#{__dir__}/hexlet_code/tag"
  autoload :Form, "#{__dir__}/hexlet_code/form"
  autoload :Render, "#{__dir__}/hexlet_code/render"
  autoload :Inputs, "#{__dir__}/hexlet_code/inputs"

  def self.form_for(struct, options = {})
    form = HexletCode::Form.new(struct, **options)

    yield(form) if block_given?

    Render.render_form(form)
  end
end
