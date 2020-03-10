Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  namespace :admin do
    resources :users
  end
  resources :tasks
  resources :labels
  root 'tasks#index'
end
