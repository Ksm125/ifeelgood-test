# frozen_string_literal: true

class Fulfillment
  # Representation of a reward
  module Reward

    # Get all rewards from the API
    def get_all_rewards
      url = URI.join(endpoint, 'rewards').to_s
      client.get(url)
    end

    # Get a specific reward from the API by reward SKU
    def get_reward(sku)
      url = URI.join(endpoint, "rewards/#{sku}").to_s
      client.get(url)
    end
  end
end

