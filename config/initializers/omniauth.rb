Rails.application.config.middleware.use OmniAuth::Builder do
  provider :auth0,
           ENV.fetch('AUTH0_CLIENT_ID'),
           ENV.fetch('AUTH0_CLIENT_SECRET'),
           ENV.fetch('AUTH0_DOMAIN', 'patient-bar-7812.auth0.com'),
           authorize_params: { scope: 'openid profile' }
end
