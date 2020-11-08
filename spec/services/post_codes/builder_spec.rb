require 'rails_helper'
RSpec.describe PostCodes::Builder do
  describe '#build' do
    it 'returns model if code is valid' do
      validaton = double(success?: true)
      checker = double(valid?: true)
      builder = described_class.new('code')
      expect(builder).to receive(:validation).and_return(validaton)
      expect(builder).to receive(:checker).and_return(checker)
      result = builder.build
      expect(result.valid).to eq true
      expect(result.code).to eq 'code'
    end

    it 'returns modell if code is invalid' do
      validaton = double(success?: false)
      builder = described_class.new('code')
      expect(builder).to receive(:validation).and_return(validaton)
      result = builder.build
      expect(result.valid).to eq false
      expect(result.code).to eq 'code'
    end
  end
end
