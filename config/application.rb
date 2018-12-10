require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Condominium
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.application_name = 'Condominium App'
    config.load_defaults 5.2
    config.i18n.available_locales = [:en, :'pt-BR']
    config.i18n.default_locale = :'pt-BR'
    config.active_record.default_timezone = :local
    config.load_defaults 5.1
  end
end
