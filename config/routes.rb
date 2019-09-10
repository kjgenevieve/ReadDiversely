Rails.application.routes.draw do
  root 'application#index'
  resources :reader_books
  resources :books
  resources :authors
  resources :readers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end