Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "static_pages#show"
  devise_for :users
  resources :reviews, except: [:index] do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]

  namespace :admin do
    resources :reviews, only: [:index, :update]
  end
end
