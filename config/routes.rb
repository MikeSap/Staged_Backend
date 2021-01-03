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
      
      get "/music/:page", to: "events#music"
      get "/merch/:page", to: "events#merch"
      get "/shows/:page", to: "events#shows"
      get "/followed_events/:page", to: "events#followed_events"
      get "/suggested_events", to: "events#suggested_events"
      post "/date_events", to: "events#date_events"
      post "/managed_events/:page", to: "events#managed_events"
      post "/band_info", to: "bands#band_info"
      post "/bands_search", to: "bands#bands_search"
      post "/users_search", to: "users#users_search"

    end
  end
end
