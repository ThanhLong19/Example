Rails.application.routes.draw do
  root "home#index"

  get "signup", to: "users#new"
  post "signup", to: "users#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
