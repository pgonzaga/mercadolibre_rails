class AddSiteIdToMercadolibreRailsSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :mercadolibre_rails_sellers, :site, foreign_key: true
    add_index :mercadolibre_rails_sellers, %i[mercadolibre_id site_id], name: 'ml_id_site_id_on_sellers'
  end
end
