Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  namespace :admin do
    resources :users
  end
  resources :tasks
  root 'tasks#index'
end
