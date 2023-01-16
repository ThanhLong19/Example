# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "users/edit", to: "users#edit"
  patch "users/edit", to: "users#update"
  get "profile", to: "users#show"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end
