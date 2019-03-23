Rails.application.routes.draw do

  root 'base#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/show'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  post 'events/create'

  resources :users
  resources :events, only: [:new, :create, :show, :index]
end
