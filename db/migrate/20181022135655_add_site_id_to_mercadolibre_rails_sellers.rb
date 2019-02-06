class AddSiteIdToMercadolibreRailsSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :mercadolibre_rails_sellers, :mercadolibre_rails_site, foreign_key: true,
                  index: { name: 'mercadolibre_sellers_on_site_id' }
    add_index :mercadolibre_rails_sellers, %i[mercadolibre_id mercadolibre_rails_site_id],
              name: 'ml_id_site_id_on_sellers'
  end
end
