module MercadolibreRails
  class Picture < ApplicationRecord
    belongs_to :product, class_name: 'MercadolibreRails::Product'

    validates_presence_of :url
    validates_uniqueness_of :url
  end
end
