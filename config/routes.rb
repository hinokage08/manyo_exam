Rails.application.routes.draw do
  get 'sessions/new'
  
  resources :tasks
  root 'tasks#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end

  resources :labels

end
