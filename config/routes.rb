Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
    resources :reviews
    end


    namespace :account do
      resources :groups
      resources :posts
      resources :reviews
    end
  root 'groups#index'
end
