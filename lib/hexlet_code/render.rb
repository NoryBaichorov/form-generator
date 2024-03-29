# frozen_string_literal: true

module HexletCode
  # Class Render
  class Render
    def self.render_form(form)
      HexletCode::Tag.build("form", form.form_body[:form_options], form.form_body[:inputs],
                            form.form_body[:submit])
    end
  end
end
