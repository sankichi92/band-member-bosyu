Rails.application.routes.draw do
  root 'auth0#login'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
end
