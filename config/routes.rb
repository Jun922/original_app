Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"

  resources :categories, only: [:index]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
