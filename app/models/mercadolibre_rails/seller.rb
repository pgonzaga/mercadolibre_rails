require 'mercadolibre_api'

module MercadolibreRails
  class Seller < ApplicationRecord
    has_many :products, dependent: :destroy
    belongs_to :site

    delegate :code, to: :site, prefix: true
    after_create_commit :create_products

    def self.create_from(product_url:)
      ml_product_id = MercadolibreApi::Products::Queries::GetID.run!(product_url: product_url)
      ml_seller_id = MercadolibreApi::Sellers::Queries::GetID.run!(product_id: ml_product_id)
      ml_site_code = MercadolibreApi::Sites::Queries::GetCode.run!(product_url: product_url)

      ml_site = MercadolibreRails::Site.where(code: ml_site_code).first_or_create
      where(mercadolibre_id: ml_seller_id, site: ml_site).first_or_create
    end

    private

    def create_products
      ordered_products = MercadolibreApi::Sellers::Products::Queries::MostSold.run!(
        seller_id: mercadolibre_id, site_code: site_code
      )

      ordered_products.each { |product| products.where(mercadolibre_id: product[:id]).first_or_create }
    end
  end
end
