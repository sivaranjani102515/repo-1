class RemoveFieldProducts < ActiveRecord::Migration[7.0]
  def up
    remove_column :products, :stripe_pricing_id
    remove_column :products, :stripe_products_id
  end

end
