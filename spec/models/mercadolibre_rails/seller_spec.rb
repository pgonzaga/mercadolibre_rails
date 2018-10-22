RSpec.describe MercadolibreRails::Seller, type: :model do
  let(:product_url) { 'https://articulo.mercadolibre.com.uy/MLU-445121140-masajeador-anti' }
  it { is_expected.to have_many :products }

  describe '.create_from' do
    it 'creates the seller with the right mercadolibre_id' do
      expect { described_class.create_from(product_url: product_url) }
        .to change { MercadolibreRails::Seller.where(mercadolibre_id: 150_040_477).count }.by(1)
    end
  end
end
