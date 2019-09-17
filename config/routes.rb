Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :avatars, only: [:create]
  end
  resources :comments
  get '/team', :to=> 'staticpage#show' 
  root 'staticpage#index'
  
  resources :city, only: [:show]
  
  resources :forums do
    resources :comments
  end
  resources :city

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :events
end
