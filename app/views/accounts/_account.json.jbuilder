# frozen_string_literal: true

json.extract! account, :id, :description, :type, :cost, :company_id, :created_at, :updated_at
json.url account_url(account, format: :json)
