Rails.application.routes.draw do
  devise_for :users
  root to: "categorys#index"

  resources :makers, only: [:index, :create]

end
