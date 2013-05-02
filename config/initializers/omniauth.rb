OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.development?
  provider :google_apps, domain: 'bignerdranch.com'
end