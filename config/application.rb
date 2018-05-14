require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AppHowl
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
  config.assets.paths << "#{Rails}/app/assets/fonts"
  end
end
