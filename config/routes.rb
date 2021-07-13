Rails.application.routes.draw do
  get 'rides/update'
  get 'attractions/index'
  get 'attractions/show'
  get 'attractions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  resources :users, only: [:new,:create,:show]
  resources :attractions
  resources :rides, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

end
