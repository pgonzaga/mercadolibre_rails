# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'mercadolibre_rails/version'

Gem::Specification.new do |s|
  s.name        = 'mercadolibre_rails'
  s.version     = MercadolibreRails::VERSION
  s.authors     = ['Pablo Gonzaga']
  s.email       = ['pgonzaga.uy@gmail.com']
  s.homepage    = 'https://github.com/pgonzaga/mercadolibre_rails'
  s.summary     = 'Library to integrate MercadolibreApi into a Rails Project.'
  s.description = 'Library to integrate MercadolibreApi into a Rails Project'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.2.1'

  s.add_development_dependency 'pg', '~> 1.1.3'
  s.add_development_dependency 'rubocop', '~> 0.59.2'
end
