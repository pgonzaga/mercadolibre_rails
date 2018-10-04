FactoryBot.define do
  factory :mercadolibre_site, class: MercadolibreRails::Site do
    sequence(:code) { |n| "MLU-#{n}" }
    active { false }

    trait :active do
      active { true }
    end
  end
end
