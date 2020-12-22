Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do

      resources :users
      resources :bands
      resources :events
      resources :comments
      resources :connections
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      
      get "/followed_events", to: "events#followed_events"
      get "/suggested_events", to: "events#suggested_events"
      post "/date_events", to: "events#date_events"
      post "/managed_events", to: "events#managed_events"
      post "/band_info", to: "bands#band_info"

    end
  end
end
