Snazzdat::Application.routes.draw do
  resources :addresses

  resources :sizes

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end