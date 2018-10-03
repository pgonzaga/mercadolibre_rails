$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "mercadolibre_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mercadolibre_rails"
  s.version     = MercadolibreRails::VERSION
  s.authors     = ["Pablo Gonzaga"]
  s.email       = ["pgonzaga.uy@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MercadolibreRails."
  s.description = "TODO: Description of MercadolibreRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "pg"
end
