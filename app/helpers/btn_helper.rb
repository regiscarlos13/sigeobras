# frozen_string_literal: true

module BtnHelper # :nodoc:
  def btn_new(link, options = nil)
    link_to link, class: 'btn  btn-outline-secondary btn-icon-split btn-sm', title: 'Novo Registro', remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-plus-lg'),
                  class: 'icon text-white-50') + content_tag(:span, 'Novo Registro',
                                                             class: 'text d-none d-lg-block d-xl-block d-md-block')
    end
  end

  def btn_edit(link, options = nil)
    link_to link, class: 'btn btn-outline-secondary btn-icon-split btn-sm ', title: 'Editar Registro',
                  remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-pencil'),
                  class: 'icon text-white-50') + content_tag(:span, 'Editar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end

  def btn_show(link, options = nil)
    link_to link, class: 'btn btn-info btn-icon-split btn-sm', title: 'Listar Registros', remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'fa fa-search'),
                  class: 'icon text-white-50') + content_tag(:span, 'Listar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end

  def btn_delete(link, options = nil)
    button_to link, class: 'btn btn-outline-danger btn-icon-split btn-sm', method: :delete, data: {
      controller: 'alert', action: 'click->alert#delete'
    }, title: 'Apagar Registro', remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-trash'),
                  class: 'icon text-white-50') + content_tag(:span, 'Apagar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end

  def btn_print(link)
    link_to link, format: :pdf, class: 'btn btn-warning btn-icon-split btn-sm', target: '_blank',
                  title: 'Imprimir Registro' do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-printer'),
                  class: 'icon text-white-50') + content_tag(:span, 'Imprimir',
                                                             class: 'text d-none d-lg-block d-xl-block d-md-block')
    end
  end

  def btn_cancel(link, options = nil)
    link_to link, class: 'btn btn-outline-danger btn-icon-split btn-sm', title: 'Cancelar Registro', remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-x-lg'),
                  class: 'icon text-white-50') + content_tag(:span, 'Cancelar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end

  def btn_back(link, options = nil)
    link_to link, class: 'btn btn-outline-primary btn-icon-split btn-sm', title: 'Voltar', remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-arrow-left'),
                  class: 'icon text-white-50') + content_tag(:span, 'Voltar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end

  def btn_save(options = nil)
    button_tag class: 'btn btn-outline-success btn-icon-split btn-sm', title: 'Salvar Registro',
               data: { disable_with: 'Salvando...' }, remote: options do
      content_tag(:span, content_tag(:i, nil, class: 'bi bi-save'),
                  class: 'icon text-white-50') + content_tag(:span, 'Salvar',
                                                             class: 'text d-none d-lg-block d-xl-block')
    end
  end
end
