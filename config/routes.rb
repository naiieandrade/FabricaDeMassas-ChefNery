Rails.application.routes.draw do

  get 'invoices/index'

  get 'invoices/show'

  get 'invoices/create'

  get 'invoices/new'

  resources :couriers
  get 'carts/show'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'sessions/new'

  get 'users/new'

  get 'products/show_category', to: 'products#show_category'

  get 'products/italian_culinary', to: 'products#italian_culinary'
  get 'products/oriental_culinary', to: 'products#oriental_culinary'
  get 'products/arabic_culinary', to: 'products#arabic_culinary'
  get 'products/brazilian_culinary', to: 'products#brazilian_culinary'

  resources :ingredients
  
  resources :products do 
    resources :reviews, except: [:show, :index]
  end  
  
  resources :users
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  get 'orders/show'
  get 'orders/new'

  resources :orders
  resources :orders do
  collection do
    post :update_status, :as => :update_status
  end   
  end
  #match "update_status" => "orders#update_status", :as => "update_status"

  resources :invoices
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
  get "/review/:id/remove" => "review#destroy"

end
