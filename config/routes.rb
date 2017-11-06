Rails.application.routes.draw do
  get '/' => 'cars#index'
  get '/cars' => 'cars#index'
  get '/cars/new' => 'cars#new'
  post '/cars' => 'cars#create'
  get '/cars/:id' => 'cars#show'
  get '/cars/:id/edit' => 'cars#edit'
  patch '/cars/:id' => 'cars#update'
  delete '/cars/:id' => 'cars#destroy'

  get '/signup' => "users#new"
  post '/users' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"

  get '/favorite_cars' => 'favorite_cars#index'
  post '/favorite_cars' => 'favorite_cars#create' 
  delete '/favorite_cars/:id' => 'favorite_cars#destroy'
end
