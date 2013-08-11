Snazzdat::Application.routes.draw do
  resources :partners

  resources :appointments



  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :sizes
    resources :addresses
  end
end