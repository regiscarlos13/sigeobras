# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :set_construction
  after_action  :default_values, only: %i[create update]
  before_action :select_construncion, only: %i[new edit]

  def index
    @expenses = if current_user.admin?
                  current_user.company.expenses.includes(:construction, :account, :category).where(constructions: { final: false })
                else
                  current_user.company.expenses.includes(:construction, :account, :category).where(constructions: { final: false, id: current_user.user_constructions.map(&:construction_id) })
                end
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to new_expense_path, notice: 'Despesa criada com sucesso.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path, notice: 'Despesa atualizado com sucesso' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Despesa removida com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  def select_construncion
    @selected_construction =  @expense.nil? ? cookies[:construction] : @expense.construction_id 
    @selected_category     =  @expense.nil? ? cookies[:category] : @expense.category_id 
  end

  def default_values
    cookies[:construction] =  @expense.construction_id
    cookies[:category]     =  @expense.category_id
  end

  def set_construction
    @constructions = current_user.admin? ? Construction.where(final: false) : Construction.where(id: current_user.user_constructions.map(&:construction_id))
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:valor, :data, :construction_id, :account_id,
                                    :category_id, :recibo).merge(company: current_user.company)
  end
end
