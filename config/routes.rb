Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :orders, only:[:index]
  resources :user, only: [:create]
  root to: 'items#index'
end
