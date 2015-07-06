require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webpatas
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.i18n.locale = :'pt-BR'
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = %i(pt-BR en)
    config.i18n.enforce_available_locales = false
    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.template_engine :slim
      g.test_framework false
    end
    config.i18n.default_locale = 'pt-BR'
    config.autoload_paths << "#{Rails.root}/app/enumerations"
  end
end
