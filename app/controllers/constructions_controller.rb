# frozen_string_literal: true

class ConstructionsController < ApplicationController
  before_action :set_construction, only: %i[show edit update destroy]

  def index
    @constructions = current_user.company.constructions
  end

  def new
    @construction = Construction.new
  end

  def edit; end

  def show; end

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
