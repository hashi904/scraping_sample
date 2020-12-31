Rails.application.routes.draw do
  resources :admins
  namespace :api do
    get 'provide_feeds', to: 'provide_feeds#index'
  end
end
