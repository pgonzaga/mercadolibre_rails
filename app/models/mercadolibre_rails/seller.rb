require 'mercadolibre_api'

module MercadolibreRails
  class Seller < ApplicationRecord
    has_many :products, dependent: :destroy
    belongs_to :site

    delegate :code, to: :site, prefix: true

    class << self
      def create_from(product_url:)
        ml_product_id = MercadolibreApi::Products::Queries::GetID.run!(product_url: product_url)
        ml_seller_id = MercadolibreApi::Sellers::Queries::GetID.run!(product_id: ml_product_id)
        ml_site_code = MercadolibreApi::Sites::Queries::GetCode.run!(product_url: product_url)

        ml_site = MercadolibreRails::Site.where(code: ml_site_code).first_or_create
        seller = where(mercadolibre_id: ml_seller_id, site: ml_site).first_or_create

        MercadolibreRails::SyncMercadolibreSellerJob.perform_now(seller.id)
      end

      def sync_all
        all.each { |seller| MercadolibreRails::SyncMercadolibreSellerJob.perform_now(seller.id) }
      end
    end
  end
end
