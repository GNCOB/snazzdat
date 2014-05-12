Snazzdat::Application.routes.draw do
  resources :locations
  root :to => 'home#index'
  post '/location/set', to: 'application#set_location'
  get '/location/get', to: 'application#get_location'
  get '/login' => 'sessions#new', as: :log_in
  get '/logout' => 'sessions#destroy', as: :log_out
  get '/signup' => 'users#new', as: :sign_up
  get '/terms' => 'static_pages#terms'
  get '/faqs' => 'static_pages#faqs'
  get '/privacy' => 'static_pages#privacy'
  get '/measure' => 'static_pages#measure'
  get '/about_us' => 'static_pages#about_us'
  get '/how_to_use' => 'static_pages#how_to_use'
  resources :users, only: [:new, :create, :edit, :update, :show] do
    get :my_matches, on: :member
    resources :sizes
  end
  resources :sessions, only: [:new, :create, :destroy] do
    get :password_reset_form, on: :collection
    post :password_reset, on: :collection
  end
  resources :search, only: [:index]
  resources :partners
  resources :appointments
end