Rails.application.routes.draw do
  devise_for :users

  resources :comments

  get 'staticpage/new'
  root'staticpage#index'
  get 'staticpage/show'
  resources :city, only: [:show]
end

