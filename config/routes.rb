Rails.application.routes.draw do
  resources :search, only: [:index]
  resources :results, only: [:index]
  resources :shops, only: [:index, :show, :create, :destroy]

  root 'search#index'
end
