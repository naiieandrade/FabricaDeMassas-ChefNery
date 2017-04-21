Rails.application.routes.draw do
  resources :reviews
  get 'sessions/new'

  get 'users/new'

  resources :ingredients
  resources :products
  resources :users

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

  get 'home/about'
  get 'home/contact'

  get "home" => "home#index"
end
