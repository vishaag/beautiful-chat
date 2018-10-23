Rails.application.routes.draw do
  
  post '/messages/:id', to: 'messages#create'
  get '/messages/:id', to: 'messages#index'
 

  root 'static_pages#home'
  
  
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
end
