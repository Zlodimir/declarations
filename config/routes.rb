Rails.application.routes.draw do
  root 'home#index'

  resources :declarations, only: [:create, :show]
  resources :operations, only: :index
end
