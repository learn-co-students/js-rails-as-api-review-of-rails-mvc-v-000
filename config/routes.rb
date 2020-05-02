Rails.application.routes.draw do
  # Add route from Readme
  # get "/index", to: "birds#index"
  get "/birds" => "birds#index"
  # resources :birds
end