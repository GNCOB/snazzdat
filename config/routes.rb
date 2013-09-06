Snazzdat::Application.routes.draw do

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :sizes
    resources :addresses
    resources :appointments
  end

  resources :search, only: [:index]
  resources :partners

end