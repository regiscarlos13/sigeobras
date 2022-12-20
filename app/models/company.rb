# frozen_string_literal: true

class Company < ApplicationRecord
  validates_presence_of :cnpj, :name
  validates_uniqueness_of :cnpj

  has_many :users, dependent: :destroy
  has_many :engineers, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :constructions, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :additives, dependent: :destroy
end
