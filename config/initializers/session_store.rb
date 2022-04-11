if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_links_api", domain: ENV['HEROKU_APP_DOMAIN']
else
  Rails.application.config.session_store :cookie_store, key: "_links_api"
end
