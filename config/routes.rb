Rails.application.routes.draw do
  devise_for :users
  root to: "room2s#index"
  
  resources :users, only: [:show, :edit, :update]
  
  resources :relationships, only: [:create, :destroy]

  resources :room2s, only: [:index, :new, :create] do
    resources :posts, only: [:index, :create]
  end

  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  
  resources :users do
    member do
      get :following, :followers
    end
  end
end