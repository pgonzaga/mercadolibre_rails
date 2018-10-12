class AddObjectChangesToMercadolibreRailsVersions < ActiveRecord::Migration[5.2]
  TEXT_BYTES = 1_073_741_823

  def change
    add_column :mercadolibre_rails_versions, :object_changes, :text, limit: TEXT_BYTES
  end
end
