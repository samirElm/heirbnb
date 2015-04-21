Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
  #   resources :flats
  # end

  # resources :flats, only: [:index, :show]


  resources :users, only: [:show]

  # namespace :users do
  #   resources :flats
  # end

  resources :flats, only: [:index, :show] #, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  namespace :account do
    resources :flats
  end

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root to: "pages#home"

end
