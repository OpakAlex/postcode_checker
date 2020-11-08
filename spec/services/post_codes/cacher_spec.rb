require 'rails_helper'
RSpec.describe PostCodes::Cacher do
  describe '.get | .set' do
    it 'returns cached value when value is present' do
      value = 'code'
      storage = double(read: true, write: nil)
      expect(described_class).to receive(:cache_storage).twice.and_return(storage)
      described_class.set(value)
      expect(described_class.get(value)).to eq true
    end
  end
end
