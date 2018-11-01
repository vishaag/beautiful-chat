Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  #post '/messages/:id', to:'messages#create'
  #get '/messages/:id', to:'messages#index'

  resources :users do
    scope module: 'users' do
      resources :messages, only: [:create, :index]
    end
  end

  resources :groups do
    scope module: 'groups' do
      resources :messages, only: [:create, :index]
    end

    resources :group_users, only: [:create, :destroy, :update]
  end


end
