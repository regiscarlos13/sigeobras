# frozen_string_literal: true

json.extract! construction, :id, :description, :dt_start, :dt_end, :valor, :final, :company_id, :category_id,
              :engineer_id, :created_at, :updated_at
json.url construction_url(construction, format: :json)
