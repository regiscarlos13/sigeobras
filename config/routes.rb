# frozen_string_literal: true

Rails.application.routes.draw do
  get 'report/constructions'
  resources :additives
  resources :expenses
  resources :constructions
  resources :categories
  resources :accounts
  resources :engineers
  resources :companies, expect: [:show]
  root 'home#index'

  devise_for :users, skip: [:registrations]
  resources :users do
    resources :user_constructions
  end
end
