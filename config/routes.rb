Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :treks do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show]
  resource :dashboard, only: [:show]

  namespace :user do
    resources :treks, only: :index
    resources :bookings, only: :index
  end
end
