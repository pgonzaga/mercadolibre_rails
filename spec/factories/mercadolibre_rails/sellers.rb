FactoryBot.define do
  factory :mercadolibre_seller, class: MercadolibreRails::Seller do
    mercadolibre_id { 95_592_600 }
    site { create(:mercadolibre_site) }
  end
end
