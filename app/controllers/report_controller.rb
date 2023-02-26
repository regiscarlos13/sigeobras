# frozen_string_literal: true

class ReportController < ApplicationController
  def constructions
    @constructions = finalizado(Construction).where('dt_start >= :start AND dt_end <= :end',
                                                    start: start_date,
                                                    end: end_date)
                                             .order(dt_start: :desc)
    format_pdf('report/pdf/constructions', 'constructions')
  end

  def finalizado(field)
    return field.final_all if params[:finalizado].blank?
    return field.final_true if params[:finalizado].eql?('true')
    return field.final_false if params[:finalizado].eql?('false')
  end

  def start_date
    params[:start_date] = Date.today.beginning_of_year if params[:start_date].blank?

    params[:start_date].to_datetime.beginning_of_day
  end

  def end_date
    params[:end_date] = Date.today.end_of_year if params[:end_date].blank?

    params[:end_date].to_datetime.end_of_day
  end
end
