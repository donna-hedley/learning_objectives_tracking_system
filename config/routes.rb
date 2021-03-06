Rails.application.routes.draw do
  resources :books
  resources :authors
  get 'sessions/new'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :topics do
    resources :objectives
  end
  resources :articles do
    resources :comments
  end
  resources :objectives
  resources :notes
 end
