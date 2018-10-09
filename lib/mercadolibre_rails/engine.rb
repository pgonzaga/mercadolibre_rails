# frozen_string_literal: true

module MercadolibreRails
  class Engine < ::Rails::Engine
    isolate_namespace MercadolibreRails

    initializer 'mercadolibre_rails', before: :load_config_initializers do |_app|
      config.paths['db/migrate'].expanded.each do |expanded_path|
        Rails.application.config.paths['db/migrate'] << expanded_path
      end
    end
  end
end
