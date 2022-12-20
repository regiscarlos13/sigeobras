# frozen_string_literal: true

json.extract! engineer, :id, :cpf, :name, :company_id, :created_at, :updated_at
json.url engineer_url(engineer, format: :json)
