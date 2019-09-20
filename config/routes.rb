Rails.application.routes.draw do
  root 'staticpage#index'
  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :comments
  get '/team', :to=> 'staticpage#show'
  get '/aboutus', :to=> 'staticpage#aboutus'
  resources :events
  resources :forums do
    resources :comments
  end
  resources :city

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent

  resources :conversations do
    member do
      post :reply
    end
  end
  resources :newsletters
  resources :contacts, only: [:index, :new, :create]

end
