Rails.application.routes.draw do
  resources :admins
  namespace :api do
    resources :provide_feeds, only: %i[index create show destroy]
  end
end
