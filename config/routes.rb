Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', account_update: 'users/registrations' }
  root 'users#index'
end
