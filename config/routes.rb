Rails.application.routes.draw do
  root 'home#index'

  resources :venues, except: [:destroy, :edit, :update]
  resources :venues do
    resources :reviews, except: [:edit, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :users, only: [:show, :edit, :update]

  devise_for :users
end
