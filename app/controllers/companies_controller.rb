# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Empresa criada com sucesso.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Empresa atualizada com sucesso.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Empresa removida com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:cnpj, :name, :block)
  end
end
