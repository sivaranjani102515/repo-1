class AddStripeAttributesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stripe_pricing_id, :string
    add_column :products, :stripe_products_id, :string
  end
end
