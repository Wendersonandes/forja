Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.unsplash.access_key
  config.application_secret = Rails.application.credentials.unsplash.secret_access_key
  config.application_redirect_uri = "https://forja.art/oauth/callback"
  config.utm_source = "forja_app"
end
