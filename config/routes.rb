require 'sidekiq/web'

Rails.application.routes.draw do
  resources :conversations do
    resources :messages
  end

  devise_for :users
  root to: 'conversations#index'
end
