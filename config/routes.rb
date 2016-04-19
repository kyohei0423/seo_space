Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users, controllers: { registrations: 'users/registrations', account_update: 'users/registrations' }
  resources :users, only: :show
  resources :tags, only: [:index, :show]
  resources :newest, only: :index
  resources :popularest, only: :index
  resources :prototypes, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
end
