Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    registraions: "users/registraions",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users do
    collection do
      get :connection
      post :connect_google
    end
  end
end
