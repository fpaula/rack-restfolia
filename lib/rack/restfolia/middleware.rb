module Rack
  module Restfolia
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        Cache.start
        response = @app.call(env)
        Cache.clear
        response
      end
    end
  end
end
