Rails.application.routes.draw do
  
  # get 'post_list', to: 'posts#list'
  # get 'new_post', to: 'posts#new'
  # post 'create_post', to: 'posts#create'
  # get 'current_post/:id', to: 'posts#current'
  # get 'edit_post/:id', to: 'posts#edit'
  # post 'posts/:id', to: 'posts#update'
  # post 'update_post/:id', to: 'posts#update'

  # get 'user_list', to: 'users#list'
  # get 'new_user', to: 'users#new'
  # post 'create_user', to: 'users#create'
  # get 'current_user/:id', to: 'users#current'
  # get 'edit_user/:id', to: 'users#edit'
  # post 'update_user/:id', to: 'users#update'

  resources :posts do
    resource :comments, only: [:create]
  end
  resources :users
  resources :categories
  resources :votes

  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  post '/log_out', to: 'sessions#destroy', as: :log_out




end
