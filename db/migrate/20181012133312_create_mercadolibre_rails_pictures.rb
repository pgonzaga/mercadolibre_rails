class CreateMercadolibreRailsPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :mercadolibre_rails_pictures do |t|
      t.string :url, null: false, index: { unique: true }
      t.references :mercadolibre_rails_product, foreign_key: true

      t.timestamps
    end
  end
end
