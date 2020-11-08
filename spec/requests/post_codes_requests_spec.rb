require 'rails_helper'
RSpec.describe PostCodesController, type: :request do
  describe 'GET /' do
    it 'success' do
      get post_codes_path
      expect(response.status).to eq 200
    end
  end

  describe 'POST /' do
    it 'returns result when post code is valid' do
      code = 'VALID CODE'
      mock_builder = double(build: double(valid: true, code: code))
      allow(PostCodes::Builder).to receive(:new).and_return(mock_builder)
      post post_codes_path, params: { code: code, format: 'js' }
      expect(response.status).to eq 200
      expect(response.body).to match(/Post code VALID CODE is allowed/)
    end

    it 'returns result when post code is invalid' do
      code = 'VALID CODE'
      mock_builder = double(build: double(valid: false, code: code))
      allow(PostCodes::Builder).to receive(:new).and_return(mock_builder)
      post post_codes_path, params: { code: code, format: 'js' }
      expect(response.status).to eq 200
      expect(response.body).to match(/Post code VALID CODE is not allowed/)
    end
  end
end
