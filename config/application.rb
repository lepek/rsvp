require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rsvp
  class Application < Rails::Application
    Rails.configuration.action_controller.per_form_csrf_tokens = true

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.action_dispatch.default_headers = {
        'X-Frame-Options' => 'ALLOWALL'
    }

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
