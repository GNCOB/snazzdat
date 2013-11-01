Snazzdat::Application.routes.draw do
  resources :locations
  root :to => "home#index"
  post '/location/set', to: 'application#set_location'
  get '/location/get', to: 'application#get_location'
  get "/login" => "sessions#new", as: :log_in
  get "/logout" => "sessions#destroy", as: :log_out
  get "/signup" => "users#new", as: :sign_up
  get "/terms" => "static_pages#terms"
  get "/faqs" => "static_pages#faqs"
  get "/privacy" => "static_pages#privacy"
  get "/measure" => "static_pages#measure"
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :sizes
  end
  resources :sessions
  resources :search, only: [:index]
  resources :partners


end