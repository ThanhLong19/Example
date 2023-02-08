Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    root "home#index"

    resources :sessions

    resources :passwords

    resources :password_resets, only: [:new, :create]
    get "password/reset/edit", to: "password_resets#edit"
    patch "password/reset/edit", to: "password_resets#update"

    resources :users
  end
end
