# frozen_string_literal: true

class ConstructionsController < ApplicationController
  include ChartGraph

  before_action :set_construction, only: %i[show edit update destroy chart_data_set]

  def index
    @constructions = current_user.company.constructions
  end

  def new
    @construction = Construction.new
  end

  def edit; end

  def show
    description = ['Valor Inicial', 'Valor Final']
    chart_data(description)
    format_pdf('constructions/show', 'constructions')
  end

  def chart_data_set
    valor_inicial = @construction.valor
    valor_aditivos = @construction.total_aditivos + valor_inicial
    valor_despesas = @construction.total_despesas
    valor_saldo = @construction.saldo

    [{
      label: 'Receitas',
      backgroundColor: 'transparent',
      borderColor: '#3B82F6',
      data: [valor_inicial, valor_aditivos]
    },

     {
       label: 'Despesas',
       backgroundColor: 'transparent',
       borderColor: 'red',
       data: [0, valor_despesas]
     }]
  end

  def create
    @construction = Construction.new(construction_params)

    respond_to do |format|
      if @construction.save
        format.html { redirect_to constructions_path, notice: 'Obra criada com sucesso.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @construction.update(construction_params)
        format.html { redirect_to constructions_path, notice: 'Obra atualizada com sucesso.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @construction.destroy

    respond_to do |format|
      format.html { redirect_to constructions_url, notice: 'Obra removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_construction
    @construction = Construction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def construction_params
    params.require(:construction).permit(:description, :percetage, :dt_start, :dt_end, :valor, :final, :category_id,
                                         :engineer_id).merge(company: current_user.company)
  end
end
