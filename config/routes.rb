Rails.application.routes.draw do
  root 'declarations#new'

  get '/z/:id'        => 'declarations#show', as: :declaration
  get '/z/new'        => 'declarations#new', as: :declarations
  get '/z/edit/:id'   => 'declarations#edit', as: :edit_declaration
  patch '/z/:id'      => 'declarations#update', as: :update_declaration
  post '/z/new'       => 'declarations#create', as: :create_declaration
  # get '/user/:id'     => 'users/profile#show', as: :user
  # get '/user/:id/edit'=> 'users/profile#edit', as: :edit_user
  # patch '/user/:id'   => 'users/profile#edit', as: :update_user

  resources :users, only: [:show, :edit, :update]
  resources :operations, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords' }
end
