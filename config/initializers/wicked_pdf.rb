# frozen_string_literal: true

WickedPdf.config = { layout: 'pdf' }
if Rails.env.development?
  WickedPdf.config.merge!({
                            exe_path: '/usr/local/bin/wkhtmltopdf'
                          })
end
