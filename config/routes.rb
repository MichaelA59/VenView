Rails.application.routes.draw do
  root 'home#index'

  resources :venues do
    resources :reviews, except: [:destroy]
  end

  resources :reviews, only: [:destroy]

  devise_for :users
  resources :venues
end
