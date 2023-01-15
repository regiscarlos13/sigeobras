# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :company
  # belongs_to :construction, -> { where(final: false, company_id: Current.user.company.id).order(description: :asc) }
  belongs_to :construction
  belongs_to :account, -> { where(company_id: Current.user.company.id).order(description: :asc) }
  belongs_to :category, -> { where(company_id: Current.user.company.id).order(description: :asc) }

  validates_presence_of :valor, :data

  delegate :name, to: :account, prefix: :account
  delegate :tipe, to: :account, prefix: :account
end
