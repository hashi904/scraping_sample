require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebScrapingManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # Auto load lib files
    config.load_defaults 6.0
    config.autoload_paths += ['lib']

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.api_only = true
  end
end
