# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'fixed', to: 'api/v1/credit_rates#fixed'
  get 'decreasing', to: 'api/v1/credit_rates#decreasing'
end
