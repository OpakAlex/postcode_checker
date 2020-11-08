module PostCodes
  module Outbound
    module Requests
      class PostCodesIo
        include Request

        REQUEST_TYPE = :get
        API_URL = 'https://api.postcodes.io/'.freeze

        def initialize(post_code)
          @client = Outbound::Client.new
          @response = nil
          @post_code = post_code
        end

        def call
          options = { request_type: REQUEST_TYPE, url: url }
          @response = @client.call(options)
        end

        private

        def url
          "#{API_URL}/postcodes/#{encoded_value}"
        end

        def encoded_value
          Addressable::URI.encode(@post_code)
        end
      end
    end
  end
end
