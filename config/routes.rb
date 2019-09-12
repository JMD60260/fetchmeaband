Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :avatars, only: [:create]
  end
  resources :comments
  get '/new' to: 'staticpage#new'
  root 'staticpage#new'
  get 'staticpage/show'
  resources :city, only: [:show]
  resources :forum do
    resources :comments
  end
  resources :city
end

