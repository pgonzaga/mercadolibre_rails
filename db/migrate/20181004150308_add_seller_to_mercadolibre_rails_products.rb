class AddSellerToMercadolibreRailsProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :mercadolibre_rails_products, :seller, foreign_key: true
  end
end
