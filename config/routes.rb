Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:show]

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :edit, :update, :destroy]
  end

  namespace :account do
    resources :flats
    resources :bookings, only: [:index, :create]
  end

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"

end
