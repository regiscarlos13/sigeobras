# frozen_string_literal: true

json.extract! expense, :id, :valor, :data, :company_id, :construction_id, :account_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
