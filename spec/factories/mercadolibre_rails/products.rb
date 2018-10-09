FactoryBot.define do
  factory :mercadolibre_product, class: MercadolibreRails::Product do
    mercadolibre_id { 'MLU445694345' }
    title { 'Venda Kinesiologica Cinta Terapeutica Tape Deportiva 5mx5cm' }
    price { 160.00 }
    currency_code { 'UYU' }
    sold_quantity { 1220 }
    description { 'Venda Kinesiologica Cinta Terapeutica Tape Deportiva 5mx5cm' }
    status { 'active' }
    latitude { -34.897434 }
    longitude { -56.171616 }
    seller { create(:mercadolibre_seller) }
    site { create(:mercadolibre_site) }
  end
end
