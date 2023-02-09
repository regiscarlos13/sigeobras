# frozen_string_literal: true

WickedPdf.config ||= {}
WickedPdf.config.merge!({
                          layout: 'pdf',
                          exe_path: 'lib/wkhtmltopdf'
                        })

# if Rails.env.development?
#   WickedPdf.config.merge!({
#                           })
# end
