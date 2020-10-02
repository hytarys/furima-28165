Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders, only:[:index, :create]
  end
  resources :user, only: [:create]
  root to: 'items#index'
end
