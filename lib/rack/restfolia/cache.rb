module Rack
  module Restfolia
    module Cache
      class << self
        def storage
          @hash ||= {}
        end

        def get(url)
          storage[url]
        end

        def store(url, data)
          storage[url] = data
        end

        def clear
          @hash = {}
        end

        alias :start :clear
      end
    end
  end
end