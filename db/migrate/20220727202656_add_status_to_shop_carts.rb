class AddStatusToShopCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_carts, :status, :string
  end
end
