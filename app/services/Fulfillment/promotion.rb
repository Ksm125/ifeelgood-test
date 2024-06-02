# frozen_string_literal: true

class Fulfillment
  # Representation of a reward
  module Promotion

    # Get a specific promotion from the API by promotion ID
    def get_promotion(id)
      url = URI.join(endpoint, "promotions/#{id}").to_s
      client.get(url)
    end
  end
end

