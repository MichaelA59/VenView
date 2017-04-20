Rails.application.routes.draw do
  root 'home#index'

  resources :venues do
    resources :reviews
  end

  devise_for :users
end
