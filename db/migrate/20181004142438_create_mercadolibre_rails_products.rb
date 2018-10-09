class CreateMercadolibreRailsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :mercadolibre_rails_products do |t|
      t.string :mercadolibre_id, null: false, index: { unique: true }
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.string :currency_code
      t.integer :sold_quantity, default: 0
      t.text :description
      t.string :status, default: :sync_needed
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
