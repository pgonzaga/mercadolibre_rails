class CreateMercadolibreRailsPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :mercadolibre_rails_pictures do |t|
      t.string :url, null: false, index: { unique: true }
      t.references :product, index: true, foreign_key: { to_table: :mercadolibre_rails_products }

      t.timestamps
    end
  end
end
