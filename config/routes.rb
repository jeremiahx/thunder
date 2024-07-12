# frozen_string_literal: true

Rails.application.routes.draw do
  get "users/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resource :users, only: %i[index new create]

  # Defines the root path route ("/")
  root "users#index"
end
