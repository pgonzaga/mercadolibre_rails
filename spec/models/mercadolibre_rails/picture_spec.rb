RSpec.describe MercadolibreRails::Picture, type: :model do
  subject { create(:mercadolibre_rails_picture) }

  it { is_expected.to belong_to :product }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_uniqueness_of :url }
end
