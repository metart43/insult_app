Rails.application.routes.draw do
  resources :groups, only: [:show, :create, :new]
  resources :insults, only: [:new, :create, :show, :delete]
  resources :users, except: [:index]
  post '/leave/:id', to: 'groups#leave', as: 'leave'
  post "/join/:id", to: 'groups#join', as: 'join'
  get '/home', to: 'users#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "search_groups", to: "groups#search_results"
  get "search_users", to: "users#search_results"
end
