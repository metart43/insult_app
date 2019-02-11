Rails.application.routes.draw do
  resources :groups, only: [:show, :create, :new]
  resources :insults, only: [:new, :create, :show, :delete]
  resources :users, except: [:index]
  get '/home', to: 'users#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
