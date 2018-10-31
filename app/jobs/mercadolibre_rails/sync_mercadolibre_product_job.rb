module MercadolibreRails
  class SyncMercadolibreProductJob < ApplicationJob
    queue_as :default

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def perform(product_id)
      product = MercadolibreRails::Product.find(product_id)

      ml_product = MercadolibreApi::Products::Queries::Find.run!(product_id: product.mercadolibre_id)
      ml_seller = MercadolibreRails::Seller.where(
        mercadolibre_id: ml_product[:seller_id], site: product.site
      ).first_or_create

      product.update!(
        seller: ml_seller, title: ml_product[:title], price: ml_product[:price],
        currency_code: ml_product[:currency_id], sold_quantity: ml_product[:sold_quantity],
        description: ml_product[:description], status: ml_product[:status],
        latitude: ml_product.dig(:geolocation, :latitude), longitude: ml_product.dig(:geolocation, :longitude)
      )

      ml_product[:pictures].each do |picture|
        MercadolibreRails::Picture.where(url: picture[:url], product_id: product_id).first_or_create
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
