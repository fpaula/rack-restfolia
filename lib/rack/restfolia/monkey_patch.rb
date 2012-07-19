require 'restfolia'

module Restfolia
  class EntryPoint
    alias :get_original :get

    def get(params = nil)
      if cached_response = Rack::Restfolia::Cache.get(@url)
        cached_response
      else
        response = get_original(params)
        Rack::Restfolia::Cache.store(@url, response)
        response
      end
    end
  end
end