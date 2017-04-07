Rails.application.routes.draw do
  get 'users/new'

  resources :ingredients
  resources :products

  root "home#index"

  get 'home/about'
  get 'home/contact'


  get "home" => "home#index"
end
