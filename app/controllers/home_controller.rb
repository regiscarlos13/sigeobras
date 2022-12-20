# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @obras_concluidas = current_user.company.constructions.where(final: true).count
    sum_total
  end

  def sum_total
    @total_receitas = current_user.company.constructions.where(final: false).sum(:valor)
    @total_despesas = current_user.company.expenses.joins(:construction).where(constructions: { final: false }).sum(:valor)
    @obras_andamento = current_user.company.constructions.where(final: false)
  end
end
