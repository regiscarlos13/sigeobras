# frozen_string_literal: true

module MessageHelper # :nodoc:
  def message(name)
    case name
    when 'notice' || 'success'
      'success'
    when 'alert'
      'warning'
    else
      'error'
    end
  end

  def show_message(model)
    return unless model.errors.any?

    content_tag(:div, nil, 'data-controller': 'message',
                           'data-message-name-value': 'error',
                           'data-message-msg-value':
                           "#{pluralize(model.errors.count, 'erro',
                                        plural: 'erros')} encontrado(s), por favor verifique:")
  end
end
