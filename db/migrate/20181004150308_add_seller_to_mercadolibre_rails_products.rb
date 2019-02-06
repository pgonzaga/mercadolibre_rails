class AddSellerToMercadolibreRailsProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :mercadolibre_rails_products, :mercadolibre_rails_seller, foreign_key: true,
                  index: { name: 'mercadolibre_products_on_seller_id' }
  end
end
