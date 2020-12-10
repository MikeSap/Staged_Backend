Rails.application.routes.draw do
  
  resources :events
  resources :comments
  resources :bands
  namespace :api do
    namespace :v1 do

      resources :users
      resources :bands
      resources :events
      resources :comments
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"

    end
  end
end
