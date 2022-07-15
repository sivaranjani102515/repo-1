class AddDefaultToQuantityColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :shop_cart_items, :quantity, 0
  end

  def up
    ShopCartItem.all.each do |shop_cart_item|
      shop_cart_item.update(quantity: 0) unless shop_cart_item.quantity
    end
  end
end
