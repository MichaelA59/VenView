Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :venues, except: [:destroy, :edit, :update]
end
