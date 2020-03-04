Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  resources :tasks
  root 'tasks#index'
end
