Rails.application.routes.draw do
  # Add route from Readme
  resources :birds, only: [:index]
end