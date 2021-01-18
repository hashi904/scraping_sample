Rails.application.routes.draw do
  root to: 'admins#index'
  # create user
  resources :user, only: %i[destroy]
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  # user authentication
  get    '/sign_in', to: 'sessions#new'
  post   '/sign_in', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :admins

  # api
  namespace :api do
    resources :provide_feeds, only: %i[index create show destroy]
    # user authentication
    post '/sign_in', to: 'sessions#create'
  end
end
