Rails.application.routes.draw do
  get 'carts/show'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'sessions/new'
  
  get 'users/new'

  resources :ingredients
  resources :products
  resources :users
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  get 'orders/show'
  get 'orders/new'

  resources :ingredients
  resources :products
  resources :orders

  root "home#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  post '/users/new'

  get 'home/about'
  get 'home/contact'

  get "home" => "home#index"

  get 'products/index'

end
