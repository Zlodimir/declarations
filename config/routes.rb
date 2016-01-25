Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'home#home'

  # get '/z/:id'        => 'declarations#show',    as: :declaration
  # get '/z/save/:id'   => 'declarations#save',    as: :declaration_save
  # get '/z/new'        => 'declarations#new',     as: :declarations
  # get '/z/edit/:id'   => 'declarations#edit',    as: :edit_declaration
  # patch '/z/:id'      => 'declarations#update',  as: :update_declaration
  # post '/z/new'       => 'declarations#create',  as: :create_declaration
  # get '/z'            => 'declarations#index',   as: :list
  # delete '/z/del/:id' => 'declarations#destroy', as: :delete_declaration

  resources :declarations, only: [:new, :create, :update, :edit, :destroy, :index, :show] do
    member do
      get :save
    end
  end
  get 'users/show/:id'  => 'users#show',          as: :show_user
  resources :users, only: [:edit, :update]
  resources :operations, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords' }
end
