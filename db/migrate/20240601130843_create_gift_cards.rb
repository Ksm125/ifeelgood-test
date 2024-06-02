class CreateGiftCards < ActiveRecord::Migration[7.1]
  def change
    create_table :gift_cards do |t|
      t.string :order_id
      t.string :code
      t.string :security_code
      t.string :url
      t.decimal :amount
      t.string :currency
      t.string :recipient_email

      t.timestamps
    end
  end
end
