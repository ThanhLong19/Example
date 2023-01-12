# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "profile", to: "users#show"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password_reset", to: "password_resets#new", as: :forget_password
  post "password_reset", to: "password_resets#create"
  get "password_reset", to: "password_resets#edit", as: :edit_password
  patch "password_reset", to: "password_resets#update"
  resources :users
  # resources :password_resets, only: %i[new create]
end
