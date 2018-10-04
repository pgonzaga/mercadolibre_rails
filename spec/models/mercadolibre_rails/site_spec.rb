RSpec.describe MercadolibreRails::Site, type: :model do
  subject { create(:mercadolibre_site) }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_uniqueness_of :code }
end
