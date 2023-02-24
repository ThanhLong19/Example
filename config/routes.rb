Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }, :skip => [:registrations]

  resources :users do
    collection do
      get :connection
      post :connect_google
    end
  end
end
