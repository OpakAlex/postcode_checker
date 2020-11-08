require 'rails_helper'
RSpec.describe PostCodes::Validation do
  describe '#success?' do
    it 'returns true' do
      code = 'SE1 7QD'
      expect(described_class.(code: code).success?).to eq(true)
    end

    it 'returns true if leading/trailing whitespaces' do
      code = '  SE1 7QD   '
      expect(described_class.(code: code).success?).to eq(true)
    end

    it 'returns false if blank' do
      code = ''
      expect(described_class.(code: code).success?).to eq(false)
    end

    it 'returns false if too short' do
      code = 'SE'
      expect(described_class.(code: code).success?).to eq(false)
    end

    it 'returns false if no match regexp' do
      code = 'SE1 7QDDD'
      expect(described_class.(code: code).success?).to eq(false)
    end
  end
end
