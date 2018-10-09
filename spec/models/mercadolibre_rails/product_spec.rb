RSpec.describe MercadolibreRails::Product, type: :model do
  let(:product_url) { 'https://articulo.mercadolibre.com.uy/MLU-445121140-masajeador-anti' }
  subject { create(:mercadolibre_product) }

  it { is_expected.to validate_presence_of :mercadolibre_id }
  it { is_expected.to validate_uniqueness_of(:mercadolibre_id).scoped_to(:site_id) }
  it { is_expected.to belong_to :site }
  it { is_expected.to belong_to :seller }
  it { is_expected.to respond_to :site_code }

  describe '.create_from' do
    it 'creates the product with the right mercadolibre_id' do
      expect { described_class.create_from(url: product_url) }
        .to change { MercadolibreRails::Product.where(mercadolibre_id: 'MLU445121140').count }
        .by(1)
        .and change { MercadolibreRails::Site.where(code: 'MLU').count }
        .by(1)

      created_product = MercadolibreRails::Product.find_by(mercadolibre_id: 'MLU445121140')
      created_site = MercadolibreRails::Site.find_by(code: 'MLU')

      expect(created_product.site).to eq created_site
    end
  end

  describe '#update_metadata' do
    it 'updates metadta on creation' do
      create(:mercadolibre_product, mercadolibre_id: 'MLU445121140')
      created_product = MercadolibreRails::Product.last

      expect(created_product.seller.mercadolibre_id).to eq(150_040_477)
      expect(created_product.title).to eq('Mascarilla Negra . Sachet  Puntos Negros, Acne 10 Unid')
      expect(created_product.price).to eq(399)
      expect(created_product.currency_code).to eq('UYU')
      expect(created_product.sold_quantity).to eq(130)
      expect(created_product.description).to_not be_nil
      expect(created_product.status).to_not be_nil
      expect(created_product.latitude).to eq(-34.90506)
      expect(created_product.longitude).to eq(-56.19482)
    end
  end
end
