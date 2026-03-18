Rails.application.routes.draw do
  root "hikes#index"
  resources :comments
  devise_for :users
  resources :users, only: [:show]
  resources :hikes
  get "up" => "rails/health#show", as: :rails_health_check
end