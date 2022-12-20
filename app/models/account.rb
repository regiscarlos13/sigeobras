# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :company
  has_many :expenses, dependent: :destroy

  validates_presence_of :tipe, :description, :cost

  enum tipe: [:material, :imposto, :'mão de obra', :juros, :dividendos]
  enum cost: %i[direto indireto]

  def name
    description
  end
end
