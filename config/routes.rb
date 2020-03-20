Rails.application.routes.draw do
  root 'auth0#login'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  resources :users, only: :index

  direct :livelog_member do |livelog_member_id|
    "https://livelog.ku-unplugged.net/members/#{livelog_member_id}"
  end
end
