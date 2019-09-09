Rails.application.routes.draw do
  get 'staticpage/new'
  root'staticpage#index'
  get 'staticpage/show'
  resources :city, only: [:show]
end

