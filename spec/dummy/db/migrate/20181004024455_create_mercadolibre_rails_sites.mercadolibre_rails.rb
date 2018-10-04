# This migration comes from mercadolibre_rails (originally 20181003152541)
class CreateMercadolibreRailsSites < ActiveRecord::Migration[5.2]
  def change
    create_table :mercadolibre_rails_sites do |t|
      t.string :code, null: false, index: { unique: true }
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
