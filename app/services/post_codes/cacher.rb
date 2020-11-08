module PostCodes
  class Cacher
    class << self
      def get(post_code)
        cache_storage.read(compound_key(post_code))
      end

      def set(post_code)
        cache_storage.write(compound_key(post_code), true)
      end

      private

      def compound_key(post_code)
        "post_codes_#{post_code.gsub(/\s/, '')}"
      end

      def cache_storage
        ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache')
      end
    end
  end
end
