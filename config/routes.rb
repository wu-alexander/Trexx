Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :treks do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resource :dashboard, only: [:show]
end
