module MercadolibreRails
  class Site < ApplicationRecord
    validates_presence_of :code
    validates_uniqueness_of :code
  end
end
