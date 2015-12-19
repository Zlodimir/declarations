Rails.application.routes.draw do
  root 'declarations#new'

  resources :declarations, only: [:create, :show, :edit, :update]
  resources :operations, only: :index
end
