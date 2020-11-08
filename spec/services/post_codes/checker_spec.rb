require 'rails_helper'
RSpec.describe PostCodes::Checker do
  describe '#valid?' do
    it 'returns true if value cached' do
      cacher = double(get: true)
      checker = described_class.new('code')
      expect(checker).to receive(:cacher).and_return(cacher)
      expect(checker.valid?).to eq true
    end

    it 'returns true if api returns true' do
      cacher = double(get: nil, set: nil)
      external = { 'result' => { 'lsoa' => 'Southwark' } }
      checker = described_class.new('code')
      expect(checker).to receive(:allowed_lsoa?).with('Southwark').and_return(true)
      expect(checker).to receive(:call_external_service).and_return(external)
      expect(checker).to receive(:cacher).twice.and_return(cacher)
      expect(checker.valid?).to eq true
    end

    it 'returns false if api returns empty' do
      cacher = double(get: nil)
      external = { 'result' => {} }
      checker = described_class.new('code')
      expect(checker).to receive(:call_external_service).and_return(external)
      expect(checker).to receive(:cacher).and_return(cacher)
      expect(checker.valid?).to eq false
    end

    it 'returns false if api raises error' do
      cacher = double(get: nil)
      checker = described_class.new('code')
      expect(checker).to receive(:allowed_code?).twice.and_return(false)
      expect(checker).to receive(:call_external_service).and_raise(PostCodes::Outbound::Errors::RequestFailure)
      expect(checker).to receive(:cacher).and_return(cacher)
      expect(checker.valid?).to eq false
    end

    it 'returns true if api raises error but code allowed' do
      cacher = double(get: nil, set: nil)
      checker = described_class.new('code')
      expect(checker).to receive(:allowed_code?).twice.and_return(true)
      expect(checker).to receive(:call_external_service).and_raise(PostCodes::Outbound::Errors::RequestFailure)
      expect(checker).to receive(:cacher).twice.and_return(cacher)
      expect(checker.valid?).to eq true
    end
  end
end
