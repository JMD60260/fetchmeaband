Rails.application.routes.draw do
  get 'staticpage/new'
  root'staticpage#index'
  get 'staticpage/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
