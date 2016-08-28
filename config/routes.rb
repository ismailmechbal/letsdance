Rails.application.routes.draw do
  root "programs#index"
  resources :programs, only: [:index]
  resources :participants, only: [:show]
end