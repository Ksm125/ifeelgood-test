# frozen_string_literal: true

class GiftCard < ApplicationRecord
  validates_presence_of :order_id, :code, :security_code, :recipient_email, :url, :amount, :currency
end
