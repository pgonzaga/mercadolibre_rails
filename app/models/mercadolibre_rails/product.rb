require 'mercadolibre_api'
require 'paper_trail'

module MercadolibreRails
  class Product < ApplicationRecord
    PAPER_TRAIL_VERSION_LIMIT = 2500
    has_paper_trail class_name: 'MercadolibreRails::Version', on: :update, ignore: %i[created_at updated_at]

    belongs_to :seller, optional: true
    belongs_to :site, optional: true

    validates_presence_of :mercadolibre_id
    validates_uniqueness_of :mercadolibre_id, scope: :site_id

    delegate :code, to: :site, prefix: true
    after_create_commit :update_metadata
    has_many :pictures, dependent: :destroy, class_name: 'MercadolibreRails::Picture'

    def self.create_from(url:)
      ml_id = MercadolibreApi::Products::Queries::GetID.run!(product_url: url)
      site_code = MercadolibreApi::Sites::Queries::GetCode.run!(product_url: url)

      return unless ml_id && site_code

      mercadolibre_site = MercadolibreRails::Site.find_or_create_by!(code: site_code)
      mercadolibre_site.products.find_or_create_by!(mercadolibre_id: ml_id)
    end

    # rubocop:disable Metrics/AbcSize
    def update_metadata
      ml_product = MercadolibreApi::Products::Queries::Find.run!(product_id: mercadolibre_id)
      ml_seller = MercadolibreRails::Seller.find_or_create_by!(mercadolibre_id: ml_product[:seller_id])

      update!(seller: ml_seller, title: ml_product[:title], price: ml_product[:price],
              currency_code: ml_product[:currency_id], sold_quantity: ml_product[:sold_quantity],
              description: ml_product[:description], status: ml_product[:status],
              latitude: ml_product.dig(:geolocation, :latitude), longitude: ml_product.dig(:geolocation, :longitude))

      ml_product[:pictures].each do |picture|
        MercadolibreRails::Picture.find_or_create_by!(url: picture[:url], product_id: id)
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
