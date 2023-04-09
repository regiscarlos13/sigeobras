# frozen_string_literal: true

class Construction < ApplicationRecord
  belongs_to            :company
  belongs_to            :category, default: -> { Current.user }
  belongs_to            :engineer, default: -> { Current.user }
  has_many              :expenses, dependent: :destroy
  has_many              :additives, dependent: :destroy
  has_many              :user_constructions, dependent: :destroy
  
  validates_presence_of :description, :valor, :dt_start, :dt_end, :percetage

  scope :final_true, -> { where(final: true) }
  scope :final_false, -> { where(final: false) }
  scope :final_all, -> { all }

  def name
    description
  end

  def saldo
    valor - expenses.sum(:valor) + total_aditivos
  end

  def total_despesas
    expenses.sum(:valor)
  end

  def total_aditivos
    additives.sum(:valor)
  end
end
