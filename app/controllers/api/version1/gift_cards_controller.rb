# frozen_string_literal: true

module Api
  module  Version1
    class GiftCardsController < BaseController
      def index
        _pagy, gift_cards = pagy(GiftCard.all)
        render_json gift_cards
      end

      def create
        gift_card = GiftCardCreator.create_gift_card_for!(**gift_card_params)
        render_json gift_card, status: :created
      end


      private

      def gift_card_params
        params.require(:gift_card).permit(:promotion_id, :reward_sku, :user_email, :amount)
      end
    end
  end
end
