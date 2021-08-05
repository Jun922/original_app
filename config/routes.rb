Rails.application.routes.draw do
  devise_for :users
  root to: "chat1s#index"
end
