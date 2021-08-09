Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"

  resources :categories, only: [:index] do
    resources :makers, only: [:index, :create]
  end
end
