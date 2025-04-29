# frozen_string_literal: true

require_relative "../../requests"
require_relative "provider/client"
require_relative "link_token/client"
require_relative "account_token/client"

module Merge
  module Integrations
    class Client
      # @return [Merge::Integrations::ProviderClient]
      attr_reader :provider
      # @return [Merge::Integrations::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Integrations::AccountTokenClient]
      attr_reader :account_token
      
      # @param request_client [Merge::RequestClient]
      # @return [Merge::Integrations::Client]
      def initialize(request_client:)
        @provider = Merge::Integrations::ProviderClient.new(request_client: request_client)
        @link_token = Merge::Integrations::LinkTokenClient.new(request_client: request_client)
        @account_token = Merge::Integrations::AccountTokenClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Integrations::AsyncProviderClient]
      attr_reader :provider
      # @return [Merge::Integrations::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Integrations::AsyncAccountTokenClient]
      attr_reader :account_token
      
      # @param request_client [Merge::RequestClient]
      # @return [Merge::Integrations::Client]
      def initialize(request_client:)
        @provider = Merge::Integrations::AsyncProviderClient.new(request_client: request_client)
        @link_token = Merge::Integrations::AsyncLinkTokenClient.new(request_client: request_client)
        @account_token = Merge::Integrations::AsyncAccountTokenClient.new(request_client: request_client)
      end
    end
  end
end
