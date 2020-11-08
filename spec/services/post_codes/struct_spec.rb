require 'rails_helper'
RSpec.describe PostCodes::Struct do
  describe '.new' do
    it 'creates object with 2 attributes' do
      obj = described_class.new(code: '12', valid: true)
      expect(obj.code).to eq '12'
      expect(obj.valid).to eq true
    end

    it 'creates object with default valid attribute' do
      obj = described_class.new(code: '12')
      expect(obj.code).to eq '12'
      expect(obj.valid).to eq false
    end
  end
end
