Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Event management  
  root "events#index"

  get "/events", to: "events#index"

  get "/admin/events", to: "events#admin"
  post "/admin/events", to: "events#create"

  get "/admin/events/:id", to: "events#show"

  get "/admin/events/:id/edit", to: "events#edit"
  patch "/admin/events/:id", to: "events#update"
  put "/admin/events/:id", to: "events#update"

  delete "/admin/events/:id", to: "events#destroy"

  get "/admin/events/new", to: "events#new"
  
end
