class CreateMercadolibreRailsSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :mercadolibre_rails_sellers do |t|
      t.integer :mercadolibre_id, null: false

      t.timestamps
    end
  end
end
