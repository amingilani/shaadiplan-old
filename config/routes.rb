Rails.application.routes.draw do
  get 'dashboard/show'

  get 'public_pages/home'

  # Auth0 routes for authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
end
