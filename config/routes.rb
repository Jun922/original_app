Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  resources :users, only: [:show, :edit, :update]
  
  resources :relationships, only: [:create, :destroy]

  resources :rooms, only: [:index, :new, :create, :show] do
    resources :posts, only: [:index, :create]
  end

  resources :personals, only: [:index, :new, :create, :show] do
    resources :chats, only: [:index, :create]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
end