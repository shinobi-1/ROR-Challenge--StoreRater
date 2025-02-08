Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',  # Corrected the path here
    registrations: 'users/registrations'  # Ensure this matches your controller name
  }

  # Removed the unnecessary get route for registrations
  # get "users/registrations" 

  # Other routes can go here

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
