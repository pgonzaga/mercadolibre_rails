RSpec.describe MercadolibreRails::Product, type: :model do
  let(:product_url) { 'https://articulo.mercadolibre.com.uy/MLU-445121140-masajeador-anti' }
  subject { create(:mercadolibre_product) }
  let(:mercadolibre_product) { create(:mercadolibre_product, mercadolibre_id: 'MLU445121140') }

  it { is_expected.to validate_presence_of :mercadolibre_id }
  it { is_expected.to validate_uniqueness_of(:mercadolibre_id).scoped_to(:site_id) }
  it { is_expected.to belong_to :site }
  it { is_expected.to belong_to :seller }
  it { is_expected.to respond_to :site_code }
  it { is_expected.to have_many :pictures }

  describe '.create_from' do
    it 'creates the product with the right mercadolibre_id' do
      expect { described_class.create_from(url: product_url) }
        .to change { MercadolibreRails::Product.where(mercadolibre_id: 'MLU445121140').count }
        .by(1)
        .and change { MercadolibreRails::Site.where(code: 'MLU').count }
        .by(1)
        .and change { MercadolibreRails::Seller.where(mercadolibre_id: 150_040_477).count }
        .by(1)

      created_product = MercadolibreRails::Product.find_by(mercadolibre_id: 'MLU445121140')
      created_site = MercadolibreRails::Site.find_by(code: 'MLU')

      expect(created_product.site).to eq created_site
      expect(created_product.pictures.count).to eq 3
    end
  end

  describe '#update_metadata' do
    before { mercadolibre_product }

    it 'updates metadta on creation' do
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

  describe 'paper_trail integration works' do
    before { mercadolibre_product }

    it 'creates a product version on update' do
      expect { mercadolibre_product.update(sold_quantity: 180) }
        .to change { mercadolibre_product.versions.count }.by(1)

      expect(mercadolibre_product.versions.last.changeset).to eq('sold_quantity' => [130, 180])
    end
  end
end
