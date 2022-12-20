# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :company
  has_many :constructions
  has_many :expenses

  validates_presence_of :description

  def name
    description
  end
end
