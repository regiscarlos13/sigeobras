# frozen_string_literal: true

module ApplicationHelper
  include BtnHelper
  include TableHelper
  include MessageHelper

  def color_progress(field)
    case field
    when 0..40
      'danger'
    when 41..80
      'warning'
    else
      'success'
    end
  end

  def configuration_form
    { wrapper: :horizontal_form,
      wrapper_mappings: {
        radio_buttons: :horizontal_collection
      },
      defaults: { input_html: { class: 'form-control-sm' },
                  label_html: { class: 'col-form-label col-form-label-sm' } } }
  end
end
