# frozen_string_literal: true

module Dynamoid
  # @private
  module Middleware
    class IdentityMap
      def initialize(app)
        @app = app
      end

      def call(env)
        Dynamoid::IdentityMap.clear
        @app.call(env)
      ensure
        Dynamoid::IdentityMap.clear
      end
    end
  end
end
