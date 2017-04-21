Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :venues, except: [:destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update]
end
