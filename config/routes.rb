Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :posts, only: [:index, :create]
  end
  resources :relationships, only: [:create, :destroy]
  resources :chats, only: [:index, :create]

  resources :users do
    member do
      get :following, :followers
    end
  end
end