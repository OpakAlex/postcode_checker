require 'rails_helper'
RSpec.describe PostCodes::Decorator do
  describe '#validity' do
    it "returns 'allowed'" do
      model = double(code: '', valid: true)
      expect(described_class.new(model).validity).to eq 'allowed'
    end

    it "returns 'not allowed'" do
      model = double(code: '', valid: false)
      expect(described_class.new(model).validity).to eq 'not allowed'
    end
  end
end
