Rails.application.routes.draw do
  root "static_pages#show"
  devise_for :users
end
