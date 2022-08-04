Rails.application.routes.draw do
  devise_for :users
  root "splash#index"

  resources :categories
  resources :movements
  resources :splash, only: [:index]
end
