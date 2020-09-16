Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :new, :create]
  resources :user, only: [:create]
  root to: 'items#index'
end
