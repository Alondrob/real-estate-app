Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "auth/:provider/callback", to: "sessions#google_auth"
  resources :users do
     resources :clients, only: [:index, :new] 
     resources :properties, only: [:new]
  end

  resources :tours
  resources :sessions
  resources :clients, except: [:index, :new ]
  resources :properties, except: [:new]
  resources :admins, only: [:edit, :update, :destroy]
  get '/admin/login', to: 'admins#login'
  post '/admin/logged_in', to: 'admins#logged_in'

  get '/cheapest_property', to: 'properties#cheapest'

  get '/hello', to: 'users#hello'
  get '/dashboard', to: 'admins#dashboard'
  delete '/admin/logged_out', to: 'admins#logged_out'

  delete '/clients/:id', to: 'clients#destroy'

  get '/all_properties', to: 'properties#all_properties'

  get '/about_us', to: 'application#about_us'





end
