require 'mercadolibre_api'

module MercadolibreRails
  class Seller < ApplicationRecord
    has_many :products, dependent: :destroy

    def self.create_from(product_url:)
      ml_product_id = MercadolibreApi::Products::Queries::GetID.run!(product_url: product_url)
      ml_seller_id = MercadolibreApi::Sellers::Queries::GetID.run!(product_id: ml_product_id)

      find_or_create_by!(mercadolibre_id: ml_seller_id)
    end
  end
end
