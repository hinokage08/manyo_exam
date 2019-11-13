Rails.application.routes.draw do
  get 'sessions/new'
  resources :tasks
  root 'tasks#index'

  resources :users
end
