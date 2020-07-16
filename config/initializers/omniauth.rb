

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_ID'] = "784057772331746", ENV['FACEBOOK_APP_SECRET'] = "8a2e36364e9968993fa3db7400e6ddea"
  end