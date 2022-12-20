# frozen_string_literal: true

json.extract! additive, :id, :data, :valor, :company_id, :construction_id, :created_at, :updated_at
json.url additive_url(additive, format: :json)
