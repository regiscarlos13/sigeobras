# frozen_string_literal: true

class EngineersController < ApplicationController
  before_action :set_engineer, only: %i[show edit update destroy]

  def index
    @engineers = current_user.company.engineers
  end

  def new
    @engineer = Engineer.new
  end

  def edit; end

  def create
    @engineer = Engineer.new(engineer_params)

    respond_to do |format|
      if @engineer.save
        format.html { redirect_to engineers_path, notice: 'Engenheiro cadastrado com sucesso.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @engineer.update(engineer_params)
        format.html { redirect_to engineers_path, notice: 'Engenheiro atualizado com sucesso.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @engineer.destroy

    respond_to do |format|
      format.html { redirect_to engineers_url, notice: 'Removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_engineer
    @engineer = Engineer.find(params[:id])
  end

  def engineer_params
    params.require(:engineer).permit(:cpf, :name).merge(company: current_user.company)
  end
end
