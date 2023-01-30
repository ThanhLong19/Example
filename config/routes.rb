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

  get "manager", to: "manager_user#show" #Hiển thị hết các User có trong database
  get "manager/new", to: "manager_user#new", as: :manager_new
  post "manager/new", to: "manager_user#create" #Trang tạo mới User
  get "manager/edit/:id", to: "manager_user#edit", as: :manager_edit
  patch "manager/edit/:id", to: "manager_user#update"  #Trang update User
  get "manager/destroy/:id", to: "manager_user#destroy", as: :manager_destroy #Xóa User
end
