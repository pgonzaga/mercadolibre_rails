require 'paper_trail'

module MercadolibreRails
  class Version < PaperTrail::Version
    self.table_name = :mercadolibre_rails_versions
  end
end
