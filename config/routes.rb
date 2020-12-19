Rails.application.routes.draw do
  resources :admins, only: %i[index create]
end
