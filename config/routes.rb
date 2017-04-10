Rails.application.routes.draw do
  resources :ingredients
  resources :products

  root "home#index"

  get 'home/about'
  get 'home/contact'

  devise_for :users

  get "home" => "home#index"
  get "cadastrar" => "users/sign_up"
  get "login" => "devise/sessions#new"
end
