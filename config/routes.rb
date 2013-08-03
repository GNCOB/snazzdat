Snazzdat::Application.routes.draw do
  resources :partners

  resources :appointments

  resources :addresses

  resources :sizes

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end