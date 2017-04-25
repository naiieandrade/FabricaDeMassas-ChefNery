Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  resources :ingredients
  
  resources :products do 
    resources :reviews, except: [:show, :index]
  end  
  
  resources :users

  get 'orders/show'
  get 'orders/new'

  # resources :ingredients
  # resources :products
  # resources :orders
  
  root "home#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get 'home/about'
  get 'home/contact'

  get "home" => "home#index"
  get "/review/:id/remove" => "review#destroy"

end
