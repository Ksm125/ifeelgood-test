# frozen_string_literal: true

class GiftCardCreator
  PRIMARY_CODE_KEY = 'Primary Code'
  SECURITY_CODE_KEY = 'Security Code'

  # @param promotion_id [String] the promotion id
  # @param reward_sku [String] the reward sku
  # @param recipient_email [String] the recipient email
  # @param amount [Integer] the amount. Default is nil which means the amount is set to the reward value
  def self.create_gift_card_for!(promotion_id:, reward_sku:, recipient_email:, amount: nil)
    fulfillment = Fulfillment.new
    order_id = "order_#{SecureRandom.uuid}"
    response = fulfillment.create_and_redeem_redemption!(promotion_id,
                                                         reward_sku,
                                                         order_id:,
                                                         user: { email: recipient_email },
                                                         amount:)

    reward_codes = response['data']['reward_codes']
    code = reward_codes['codes'].find { |code| code['name'] == PRIMARY_CODE_KEY }['value']
    security_code = reward_codes['codes'].find { |code| code['name'] == SECURITY_CODE_KEY }['value']
    GiftCard.create!(order_id:,
                     code:,
                     security_code:,
                     recipient_email:,
                     url: response['data']['url'],
                     amount: response['data']['value']['amount'],
                     currency: response['data']['value']['currency'])

  end
end
