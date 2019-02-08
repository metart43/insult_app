Rails.application.routes.draw do
  resources :insults
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
