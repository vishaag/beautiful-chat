Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  post '/messages/:id', to:'messages#create'
  get '/messages/:id', to:'messages#index'

  resources :users do
    resources :messages, only: [:create, :index]
  end
  resources :groups
end
