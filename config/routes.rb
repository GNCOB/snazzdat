Snazzdat::Application.routes.draw do

  resources :locations

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :sizes
    resources :addresses
    resources :appointments
  end

  resources :search, only: [:index]
  resources :partners

  post '/location/set', to: 'application#set_location'
  get '/location/get', to: 'application#get_location'
end