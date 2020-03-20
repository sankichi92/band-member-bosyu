Rails.application.routes.draw do
  root 'songs#index'
  get 'login' => 'auth0#login'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  resources :songs, except: :index

  resources :users, only: :index

  direct :livelog_member do |user|
    "https://livelog.ku-unplugged.net/members/#{user.livelog_member_id}"
  end
end
