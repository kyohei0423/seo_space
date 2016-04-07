Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users, controllers: { registrations: 'users/registrations', account_update: 'users/registrations' }
  resources :prototypes, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
end
