# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/link_token"

module Merge
  module Integrations
    class LinkTokenClient
      # @return [Merge::RequestClient]
      attr_reader :request_client
      
      # @param request_client [Merge::RequestClient]
      # @return [Merge::Integrations::LinkTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      
      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address.
      # @param end_user_organization_name [String] Your end user's organization name.
      # @param end_user_origin_id [String] A unique identifier for your end user.
      # @param categories [Array<String>] The integration categories to show in Merge Link.
      # @param integration [String, nil] The slug of a specific pre-selected integration.
      # @param link_expiry_mins [Integer, nil] The number of minutes the token is valid.
      # @param should_create_magic_link_url [Boolean, nil] Whether to generate a Magic Link URL.
      # @param request_options [Merge::RequestOptions, nil]
      # @return [Merge::Integrations::LinkToken]
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options&.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options&.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options&.account_token unless request_options&.account_token.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
          }.compact
          
          req.body = {
            end_user_email_address: end_user_email_address,
            end_user_organization_name: end_user_organization_name,
            end_user_origin_id: end_user_origin_id,
            categories: categories,
            integration: integration,
            link_expiry_mins: link_expiry_mins,
            should_create_magic_link_url: should_create_magic_link_url,
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/integrations/create-link-token"
        end

        Merge::Integrations::LinkToken.from_json(json_object: response.body)
      end
    end
    
    class AsyncLinkTokenClient
      # @return [Merge::RequestClient]
      attr_reader :request_client
      
      # @param request_client [Merge::RequestClient]
      # @return [Merge::Integrations::LinkTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      
      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address.
      # @param end_user_organization_name [String] Your end user's organization name.
      # @param end_user_origin_id [String] A unique identifier for your end user.
      # @param categories [Array<String>] The integration categories to show in Merge Link.
      # @param integration [String, nil] The slug of a specific pre-selected integration.
      # @param link_expiry_mins [Integer, nil] The number of minutes the token is valid.
      # @param should_create_magic_link_url [Boolean, nil] Whether to generate a Magic Link URL.
      # @param request_options [Merge::RequestOptions, nil]
      # @return [Merge::Integrations::LinkToken]
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options&.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options&.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options&.account_token unless request_options&.account_token.nil?
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
          }.compact
          
          req.body = {
            end_user_email_address: end_user_email_address,
            end_user_organization_name: end_user_organization_name,
            end_user_origin_id: end_user_origin_id,
            categories: categories,
            integration: integration,
            link_expiry_mins: link_expiry_mins,
            should_create_magic_link_url: should_create_magic_link_url,
          }.compact
          
          req.url "#{@request_client.get_url(request_options: request_options)}/integrations/create-link-token"
        end
        
        Merge::Integrations::LinkToken.from_json(json_object: response.body)
      end
    end
  end
end
