Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :reviewapi, only: [:index]
    end
  end

  resources :venues do
    resources :reviews, except: [:destroy]
  end

  resources :reviews, only: [:destroy]

  resources :venues, except: [:destroy, :edit, :update]
end
