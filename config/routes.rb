Rails.application.routes.draw do
  root "home#index"

  resources :sessions, only: [:new, :create, :edit, :update]
  delete "logout", to: "sessions#destroy"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  resources :password_resets, only: [:new, :create]
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  resources :users, only: [:new, :create, :edit, :update]
  get "show", to: "users#show"
  get "users/destroy/:id", to: "users#destroy", as: :users_destroy
end
