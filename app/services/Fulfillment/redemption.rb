# frozen_string_literal: true

class Fulfillment
  # Representation of a reward
  module Redemption
    class ErrorCreateAndRedeemRedemption < StandardError; end

    # Create and redeem a redemption.
    # Reference: https://docs.ifeelgoods.com/reference/createandredeemredemption
    # @param promotion_id [String] The promotion ID
    # @param reward_sku [String] The reward SKU
    # @param order_id [String] A unique order ID
    # @param user [Hash] The user information
    # @option data [String] :email The recipient email
    # @param amount [String] The value to send to the API. Not needed for "fixed value" rewards but mandatory for "free value" rewards
    def create_and_redeem_redemption!(promotion_id, reward_sku, order_id:, user:, amount: nil)
      url = URI.join(endpoint, "promotions/#{promotion_id}/rewards/#{reward_sku}/redemptions/actions/redeem").to_s
      data = { order_id:, user: }
      data[:value] = { amount: } if amount.present?
      body = { data: }
      response = client.post(url, body)
      raise ErrorCreateAndRedeemRedemption, response.body unless response.success?

      response
    end
  end
end

