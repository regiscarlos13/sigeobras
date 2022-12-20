# frozen_string_literal: true

Rails.application.routes.draw do
  get 'report/constructions'
  resources :additives
  resources :expenses
  resources :constructions
  resources :categories
  resources :accounts
  resources :engineers
  devise_for :users
  resources :companies, expect: [:show]
  root 'home#index'
end
