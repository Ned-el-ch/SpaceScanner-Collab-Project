Rails.application.routes.draw do

  resources :trips
  resources :carriers
  resources :rockets
  resources :planets
  resources :bookings
    root 'home#index'
    
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'trips', to: 'users#trips'#, as: 'trips'
    get 'account', to: 'users#show'#, as: 'account'

    get '/planets/:slug', to: 'planets#slug'
end
