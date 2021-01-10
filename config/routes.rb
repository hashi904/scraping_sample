Rails.application.routes.draw do
  root to: 'admins#index'
  # user authentication
  get    '/sign_in', to: 'sessions#new'
  post   '/sign_in', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :admins
  namespace :api do
    resources :provide_feeds, only: %i[index create show destroy]
  end
end
