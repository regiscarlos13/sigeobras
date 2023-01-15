# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @obras_andamento = current_user.company.constructions.where(final: false)
    sum_total_andamento
    sum_total_finalizado
  end

  def sum_total_andamento
    @total_receitas_andamento = sum_receitas(false) + sum_additives(false)
    @total_despesas_andamento = sum_despesas(false)
    @lucro_andamento = @total_receitas_andamento - @total_despesas_andamento
    @count_obras_andamento = count_obras(false).count
  end

  def sum_total_finalizado
    @total_receitas_finalizado = sum_receitas(true) + sum_additives(true)
    @total_despesas_finalizado = sum_despesas(true)
    @lucro_finalizado = @total_receitas_finalizado - @total_despesas_finalizado
    @count_obras_finalizado = count_obras(true).count
  end

  def count_obras(field)
    current_user.company.constructions.where(final: field)
  end

  def sum_additives(field)
    current_user.company.additives.joins(:construction).where(construction: { final: field }).sum(:valor)
  end

  def sum_receitas(field)
    current_user.company.constructions.where(final: field).sum(:valor)
  end

  def sum_despesas(field)
    current_user.company.expenses.joins(:construction).where(construction: { final: field }).sum(:valor)
  end
end
