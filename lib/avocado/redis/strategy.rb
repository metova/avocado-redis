module Avocado
  module Redis
    class Strategy
      attr_reader :redis

      def initialize(url = ENV['REDIS_URL'])
        @redis = ::Redis.new url: url
      end

      def read
        return [] if keys.empty?
        redis.mget(*keys).map do |value|
          JSON.parse value
        end
      end

      def write(data, upload_id)
        key = "avocado-#{Time.current.to_s(:nsec)}-#{upload_id}"
        redis[key] = data.to_json
      end

      def purge_old(upload_id)
        old_keys = keys.reject { |key| key.end_with? upload_id }
        redis.del(*old_keys) if old_keys.any?
      end

      private
        def keys
          redis.scan_each(match: 'avocado-*').to_a.uniq
        end
    end
  end
end
