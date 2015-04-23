Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]
  #routes liées à un appartement
  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :edit, :update, :destroy]
  end

  namespace :account do
    resources :flats
    resources :bookings, only: [:index, :create]
  end

  resources :bookings, only: [:index, :show]

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"

end
