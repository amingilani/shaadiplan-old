Rails.application.routes.draw do
  resources :weddings
  # home page
  root 'public_pages#home'

  # Auth0 routes for authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  # Dashboard
  get 'dashboard' => 'dashboard#show'
end
