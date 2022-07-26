class AddShopCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shop_carts, :user,  foreign_key: true
  end
end
