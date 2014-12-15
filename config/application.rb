require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sistemico
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'

    # Locales shown to the user will be only the ones with country. The others are just used for fallbacks
    config.i18n.available_locales = [
      # Default locales
      'pt', 'es', 'en', 'es-419',
      # Portuguese locales 
      'pt-BR',
      # Spanish locales
      # 'es-MX', 'es-CO', 
      # English locales
      # 'en-US'
    ]

    config.i18n.fallbacks = {
      #English fallbacks
      'en-US' => 'en',
      'en-GB' => 'en',
      # Spanish fallbacks
      'es-MX' => 'es-419',
      'es-CO' => 'es-419',
      'es-419' => 'es',
      # Portuguese fallbacks (default_locale fallback must come last!)
      'pt-PT' => 'pt',
      'pt-BR' => 'pt'
    }

  end
end
