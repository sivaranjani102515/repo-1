class AddStripePaymentIdToshopCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_carts, :stripe_payment_id, :string
  end
end
