Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions
  resources :clients
  resources :properties
  resources :admins, only: [:edit, :update, :destroy]
  get '/admin/login', to: 'admins#login'
  post '/admin/logged_in', to: 'admins#logged_in'
  # get '/users/new', to: 'users#new'
  # resources :coupons, only: [:index, :show, :create, :new]
  get '/hello', to: 'users#hello'
  get '/dashboard', to: 'admins#dashboard'
  delete '/admin/logged_out', to: 'admins#logged_out'

end
