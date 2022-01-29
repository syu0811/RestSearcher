Rails.application.routes.draw do
  resources :top, only: [:index]

  root 'tops#index'
end
