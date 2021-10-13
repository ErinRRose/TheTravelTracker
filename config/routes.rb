Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :ratings
  resources :users
  resources :destinations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
