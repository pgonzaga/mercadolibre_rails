FactoryBot.define do
  factory :mercadolibre_rails_picture, class: MercadolibreRails::Picture do
    sequence(:url) { |n| "https://mlb-s2-p.mlstatic.com/#{n}.jpg" }
    product { create(:mercadolibre_product, mercadolibre_id: 'MLU445121140') }
  end
end
