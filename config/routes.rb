Rails.application.routes.draw do
  
  devise_for :users
  
  resources :notifications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'admin', to: 'notifications#index_admin', as: 'admin'
  get 'client', to: 'notifications#index_client', as: 'client'

  root to: "notifications#index"
end
