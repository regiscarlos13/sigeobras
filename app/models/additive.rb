# frozen_string_literal: true

class Additive < ApplicationRecord
  belongs_to :company
  belongs_to :construction, -> { where(final: false, company_id: Current.user.company.id).order(description: :asc) }

  validates_presence_of :data, :valor
end
