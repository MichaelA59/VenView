Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :admin, only: [:index]
  resources :users, only: [:show, :edit, :update]
  resources :venues
  resources :votes, only: [:create, :update, :destroy]

  resources :venues do
    resources :reviews, except: [:edit, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  namespace :api do
    namespace :v1 do
      resources :reviewapi, only: [:index]
    end
  end
end
