Rails.application.routes.draw do
  devise_for :users
  get 'notifications/index'
  root to: "notifications#index"
  resources :notifications, only: :index
  #resources :donations, only: [:index, :new, :create]
end
