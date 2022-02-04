Rails.application.routes.draw do
  resources :search, only: [:index]
  resources :results, only: [:index]
  resources :shops, only: [:show]

  root 'search#index'
end
