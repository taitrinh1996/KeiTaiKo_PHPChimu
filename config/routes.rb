Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "static_pages#show"
  devise_for :users
  resources :reviews do
    resources :comments, only: :create
    get "form_reply"
  end
  resources :comments, only: :destroy
  resources :likes, only: [:create, :destroy]

  namespace :admin do
    resources :reviews, only: [:index, :update]
  end
end
