Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :avatars, only: [:create]
  end
  resources :comments
  get '/team', :to=> 'staticpage#show'
  root 'staticpage#index'
  
  resources :city, only: [:show]
  resources :forum do
    resources :comments
  end
  resources :city
end

