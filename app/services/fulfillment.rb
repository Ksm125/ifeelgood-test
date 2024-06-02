# frozen_string_literal: true

class Fulfillment
  include Reward
  include Promotion
  include Redemption

  VERSION = 'v2'

  private

  def endpoint(version: VERSION)
    URI.join(Client::BASE_ENDPOINT, "fulfillment/#{version}/").to_s
  end

  def client
    @client ||= Client.new(api_key: ENV['API_KEY'], api_secret: ENV['API_SECRET'])
  end
end
