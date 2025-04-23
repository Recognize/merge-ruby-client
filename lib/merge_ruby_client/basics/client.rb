# frozen_string_literal: true

require_relative "../../requests"
require_relative "integrations/client"

module Merge
  module Basics
    class Client
      # @return [Merge::Basics::IntegrationClient]
      attr_reader :integrations

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Basics::Client]
      def initialize(request_client:)
        @integrations = Merge::Basics::IntegrationClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Basics::IntegrationClient]
      attr_reader :integrations

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Basics::AsyncClient]
      def initialize(request_client:)
        @integrations = Basics::AsyncIntegrationClient.new(request_client: request_client)
      end
    end
  end
end
