Rails.application.routes.draw do
  root 'declarations#new'

  get '/z/:id'        => 'declarations#show', as: :declaration
  get '/z/new'        => 'declarations#new', as: :declarations
  get '/z/edit/:id'   => 'declarations#edit', as: :edit_declaration
  patch '/z/:id'      => 'declarations#update', as: :update_declaration
  post '/z/new'       => 'declarations#create', as: :create_declaration
  resources :operations, only: :index
end
