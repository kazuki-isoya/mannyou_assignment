Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  resources :tasks
  root 'tasks#index'
end
