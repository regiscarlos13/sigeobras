# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Usuário cadastrado com sucesso' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Usuário atualizado com sucesso' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário removido com sucesso' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if password_blank?
      params.require(:user).permit(:name, :company_id, :email, :role).except(:password, :password_confirmation)
    else
      params.require(:user).permit(:name, :company_id, :email, :role, :password, :password_confirmation)
    end
  end

  def password_blank?
    params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
  end
end
