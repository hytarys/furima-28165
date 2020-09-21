Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :user, only: [:create]
  root to: 'items#index'
end
