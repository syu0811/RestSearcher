Rails.application.routes.draw do
  resources :top, only: [:index]
  resources :search, only: [:index]
  resources :results, only: [:index]
  resources :shops, only: [:show]

  root 'tops#index'
end
