class AddSiteToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :mercadolibre_rails_products, :mercadolibre_rails_site, foreign_key: true
  end
end
