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
    has_many :pictures, dependent: :destroy, class_name: 'MercadolibreRails::Picture'

    class << self
      def create_from(url:)
        ml_id = MercadolibreApi::Products::Queries::GetID.run!(product_url: url)
        site_code = MercadolibreApi::Sites::Queries::GetCode.run!(product_url: url)

        return unless ml_id && site_code

        mercadolibre_site = MercadolibreRails::Site.where(code: site_code).first_or_create
        product = mercadolibre_site.products.where(mercadolibre_id: ml_id).first_or_create

        MercadolibreRails::SyncMercadolibreProductJob.perform_now(product.id)
      end

      def sync_all
        all.each { |product| MercadolibreRails::SyncMercadolibreProductJob.perform_now(product.id) }
      end
    end
  end
end
