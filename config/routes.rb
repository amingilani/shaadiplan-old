Rails.application.routes.draw do
  resources :teams
  resources :weddings do
    resources :guests
  end
  # home page
  root 'public_pages#home'

  # Auth0 routes for authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  # Dashboard
  get 'dashboard' => 'dashboard#show'
  get 'dashboard/manage_teams' => 'dashboard#manage_teams'
  get 'dashboard/manage_weddings' => 'dashboard#manage_weddings'
end
