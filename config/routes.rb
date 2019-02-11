Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :playlists, only: [:show]
  resources :videos, only: [:show]
  resources :video_clicks, only: [:create, :show], :defaults => { :format => 'json' }
  resources :search_users, only: [:index]  
  namespace :admin do
    resources :videos
  end
end
