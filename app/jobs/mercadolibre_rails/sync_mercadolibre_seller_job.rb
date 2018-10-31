module MercadolibreRails
  class SyncMercadolibreSellerJob < ApplicationJob
    queue_as :default

    def perform(seller_id)
      seller = MercadolibreRails::Seller.find(seller_id)

      ordered_products = MercadolibreApi::Sellers::Products::Queries::MostSold.run!(
        seller_id: seller.mercadolibre_id, site_code: seller.site_code
      )

      ordered_products.each { |product| seller.products.where(mercadolibre_id: product[:id]).first_or_create }
    end
  end
end
