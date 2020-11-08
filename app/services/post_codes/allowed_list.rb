module PostCodes
  class AllowedList
    class << self
      def code_present?(code)
        code.in? allowed_codes
      end

      def lsoa_present?(lsoa)
        lsoa.in? allowed_lsoas
      end

      def allowed_codes
        ALLOWED_POST_CODES_CONFIG['allowed_codes']
      end

      def allowed_lsoas
        ALLOWED_POST_CODES_CONFIG['allowed_lsoas']
      end
    end
  end
end
