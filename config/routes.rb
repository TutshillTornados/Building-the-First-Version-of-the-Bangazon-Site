Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'

  resources :customers
  resources :sessions
  resources :products
  resources :orders
  resources :pay_methods

  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post 'products/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
