# frozen_string_literal: true

# Base representing a client to interact with the API
class Client
  attr_reader :api_key, :api_secret
  include HTTParty

  BASE_ENDPOINT = 'https://api-sandbox.ifeelgoods.com'

  def initialize(api_key:, api_secret:)
    @api_key = api_key
    @api_secret = api_secret
  end

  def get(path, options = {})
    headers_options = options.delete(:headers) || {}
    self.class.get(path, headers: headers.merge(headers_options), query: options)
  end

  def post(path, body, options = {})
    headers_options = options.delete(:headers) || {}
    self.class.post(path, headers: headers.merge(headers_options), body: body.to_json, **options)
  end

  protected

  def headers
    {
      'Content-Type' => 'application/json',
      'API-Key' => api_key,
      'API-Secret' => api_secret
    }
  end
end
