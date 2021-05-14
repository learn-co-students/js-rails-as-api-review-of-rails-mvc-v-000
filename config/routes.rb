Rails.application.routes.draw do
  # Add route from Readme
  get '/birds', to: 'birds#index'
end