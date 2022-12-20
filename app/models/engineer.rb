# frozen_string_literal: true

class Engineer < ApplicationRecord
  belongs_to :company
  has_many :constructions

  validates_presence_of :cpf, :name
end
