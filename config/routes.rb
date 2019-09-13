Rails.application.routes.draw do
  root 'application#index'
  resources :reader_books
  resources :books
  resources :authors
  resources :readers
  resources :sessions, only: [:create, :destroy]
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'

  get '/sessions/new', to: 'sessions#new', as: '/login'
  post '/sessions/new', to: 'sessions#create', as: '/logged_in'
  
  # get 'login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end