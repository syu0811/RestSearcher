Rails.application.routes.draw do
  resources :top, only: [:index]
  resources :search, only: [:index]

  root 'tops#index'
end
