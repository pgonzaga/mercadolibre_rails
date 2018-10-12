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

  s.add_dependency 'mercadolibre_api', '~> 0.8'
  s.add_dependency 'paper_trail', '~> 10.0.1'
  s.add_dependency 'rails', '~> 5.2.1'
  s.add_dependency 'redis', '~> 4.0.2'

  s.add_development_dependency 'byebug', '~> 10.0.2'
  s.add_development_dependency 'factory_bot_rails', '~> 4.11.1'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'rubocop', '~> 0.59.2'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.13'
end
