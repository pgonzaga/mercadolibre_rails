module MercadolibreRails
  class Site < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :sellers, dependent: :destroy

    validates_presence_of :code
    validates_uniqueness_of :code
  end
end
