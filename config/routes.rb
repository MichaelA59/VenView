Rails.application.routes.draw do
  root 'home#index'

  resources :venues, except: [:destroy, :edit, :update]
  resources :venues do
    resources :reviews, except: [:edit, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :votes, only: [:create, :update, :destroy]

  devise_for :users
  resources :users, only: [:show, :edit, :update]
end
