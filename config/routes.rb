Rails.application.routes.draw do
  root "static_pages#show"
  devise_for :users
  resources :reviews, except: [:index, :destroy] do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
end
