class ShopCartItem < ApplicationRecord
  belongs_to :shop_cart
  belongs_to :product

  after_create_commit do
    broadcast_replace_to shop_cart,
                          target: "cart_count",
                          partial: "shop_carts/item_count",
                          locals: { count: shop_cart.quantity }
  end
  
  after_update_commit do
    broadcast_replace_to shop_cart,
                          target: "cart_count",
                          partial: "shop_carts/item_count",
                          locals: { count: shop_cart.quantity }
    
  end   
end
