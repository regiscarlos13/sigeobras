# frozen_string_literal: true

class AdditivesController < ApplicationController
  before_action :set_additive, only: %i[show edit update destroy]

  def index
    @additives = current_user.company.additives.joins(:construction).where(constructions: { final: false })
  end

  def show; end

  def new
    @additive = Additive.new
  end

  def edit; end

  def create
    @additive = Additive.new(additive_params)

    respond_to do |format|
      if @additive.save
        format.html { redirect_to additives_path, notice: 'Aditivo criado com sucesso.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @additive.update(additive_params)
        format.html { redirect_to additives_path, notice: 'Aditivo atualizado com sucesso.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @additive.destroy

    respond_to do |format|
      format.html { redirect_to additives_url, notice: 'Aditivo removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_additive
    @additive = Additive.find(params[:id])
  end

  def additive_params
    params.require(:additive).permit(:data, :valor, :construction_id).merge(company: current_user.company)
  end
end
