module PostCodes
  module Outbound
    module Errors
      class RequestFailure < StandardError; end
      class BadRequestError < RequestFailure; end
      class NotFoundError < BadRequestError; end
      class ApiError < BadRequestError; end
      class UnsupportedRequestTypeError < BadRequestError; end

      def handle_errors(response)
        case response.status
        when 401, 403
          raise BadRequestError, 'Auth error'
        when 404
          raise NotFoundError, 'Not Found error'
        when 500
          raise ApiError, 'API error'
        else
          response.body
        end
      end
    end
  end
end
