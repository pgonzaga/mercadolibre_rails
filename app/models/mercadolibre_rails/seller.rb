module MercadolibreRails
  class Seller < ApplicationRecord
    has_many :products, dependent: :destroy
  end
end
