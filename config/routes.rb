Rails.application.routes.draw do
  resources :admins
  namespace :api do
    resources :provide_feeds, only: %i[index create]
  end
end
