Rails.application.routes.draw do
  resources :groups, only: [:show, :create, :new]
  resources :insults, only: [:new, :create, :destroy, :show]
  # delete 'insults/:id', to: 'insults#destroy'
  resources :users, except: [:index]
  post '/leave/:id', to: 'groups#leave', as: 'leave'
  post "/join/:id", to: 'groups#join', as: 'join'
  post "/add/:id", to: "groups#add", as: "add"
  get '/home', to: 'users#home'
  get '/about', to: 'application#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "search_groups", to: "groups#search_results"
  get "search_users", to: "users#search_results"
  get "search_results", to: "application#search_results"
end
