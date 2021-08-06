Rails.application.routes.draw do
  devise_for :users
  root to: "categorys#index"

  resources :categorys, only: [:index] do
    resources :makers, only: [:index, :create]
  end
end
