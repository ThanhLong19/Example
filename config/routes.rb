Rails.application.routes.draw do
  get 'errors/file_not_found'
  get 'errors/internal_server_error'
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

  resources :projects
  resources :members

  match "/404", to: "errors#file_not_found", via: :all
  match "/422", to: "errors#unprocessable'", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
