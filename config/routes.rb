Rails.application.routes.draw do
  get '/' => 'cars#index'
  get '/cars' => 'cars#index'
  get '/cars' => 'cars#new'
  post '/cars' => 'cars#create'
  get 'cars/:id' => 'cars#show'
end
