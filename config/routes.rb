Rails.application.routes.draw do
  root "static_pages#show"
  devise_for :users
  resources :reviews, only: [:new, :create]
end
