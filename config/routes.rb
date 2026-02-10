Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Public: Event Listing
  root "events#index"

  resources :events, only: %i[ index show ]
  #get "/events", to: "events#index"
  #get "/events/:id", to: "events#show"

  # Admin: Event Management
  namespace :admin do
    resources :events
    
    #get "/events", to: "events#index"
    #get "/events/:id", to: "events#show"
    #get "/events/:id/edit", to: "events#edit"
    #post "/events", to: "events#create"
    #patch "/events/:id", to: "events#update"
    #put "/events/:id", to: "events#update"
    #delete "/events/:id", to: "events#destroy"    
    #get "/events/new", to: "events#new"    
  end   
  
end
