require 'rails_helper'
RSpec.describe PostCodes::AllowedList do
  describe '.code_present?' do
    it 'returns true if code allowed' do
      expect(described_class).to receive(:allowed_codes).and_return(%w[code code2])
      expect(described_class.code_present?('code')).to eq true
    end

    it 'returns false if code not allowed' do
      expect(described_class).to receive(:allowed_codes).and_return(%w[code code2])
      expect(described_class.code_present?('code3')).to eq false
    end
  end

  describe '.lsoa_present?' do
    it 'returns true if lsoa allowed' do
      expect(described_class).to receive(:allowed_lsoas).and_return(%w[lsoa1 lsoa2])
      expect(described_class.lsoa_present?('lsoa1')).to eq true
    end

    it 'returns false if lsoa not allowed' do
      expect(described_class).to receive(:allowed_lsoas).and_return(%w[lsoa1 lsoa2])
      expect(described_class.lsoa_present?('lsoa3')).to eq false
    end
  end
end
