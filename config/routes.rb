Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  resources :customers
  resources :sessions

  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'customerForm', to: 'customers#show', as: 'customerForm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
