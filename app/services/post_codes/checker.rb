module PostCodes
  class Checker
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def valid?
      return true if cacher.get(code)

      response = call_external_service
      return false unless allowed_lsoa?(response['result']['lsoa'])

      cacher.set(code)
      true
    rescue Outbound::Errors::RequestFailure
      cacher.set(code) if allowed_code?
      allowed_code?
    end

    private

    def allowed_code?
      @allowed_code ||= AllowedList.code_present?(code)
    end

    def cacher
      @cacher ||= Cacher
    end

    def allowed_lsoa?(lsoa)
      return false unless lsoa.present?

      AllowedList.lsoa_present?(lsoa.split(' ').first)
    end

    def call_external_service
      req = Outbound::Requests::PostCodesIo.new(@code)
      req.call
      JSON.parse(req.response.body) || { 'result' => {} }
    end
  end
end
