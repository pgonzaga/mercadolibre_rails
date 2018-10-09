RSpec.describe MercadolibreRails::Seller, type: :model do
  it { is_expected.to have_many :products }
end
