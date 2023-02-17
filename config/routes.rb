Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    registraions: "users/registraions",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users do
    get :connection, on: :collection
  end
  resources :users
end
