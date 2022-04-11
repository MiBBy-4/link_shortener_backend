require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LinkShortenerBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_controller.default_protect_from_forgery = true

    if Rails.env == 'production'
      config.session_store :cookie_store, key: "_links_api", domain: ENV['HEROKU_APP_DOMAIN'], secure: true, same_site: :none
    else
      config.session_store :cookie_store, key: "links_api"
    end

    config.middleware.use ActionDispatch::Cookies
    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false
  end
end
