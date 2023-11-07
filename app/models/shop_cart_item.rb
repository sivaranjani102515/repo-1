# == Schema Information
#
# Table name: shop_cart_items
#
#  id           :bigint           not null, primary key
#  quantity     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :integer          not null
#  shop_cart_id :integer          not null
#
# Indexes
#
#  index_shop_cart_items_on_product_id    (product_id)
#  index_shop_cart_items_on_shop_cart_id  (shop_cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (shop_cart_id => shop_carts.id)
#
class ShopCartItem < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :shop_cart
  belongs_to :product

  after_create_commit do
    # turbo use broadcast to modify the view
    broadcast_replace_to shop_cart,
                          target: "cart_count",
                          partial: "shop_carts/item_count",
                          locals: { count: shop_cart.quantity }
    
    broadcast_replace_to shop_cart,
                          target: "total_price",
                          partial: "shop_carts/total_price",
                          locals: { current_cart: shop_cart }
  end

  after_update_commit do
    broadcast_replace_to shop_cart,
                          target: "cart_count",
                          partial: "shop_carts/item_count",
                          locals: { count: shop_cart.quantity }
    
    broadcast_replace_to shop_cart,
                          target: dom_id(self, "quantity"),
                          partial: "shop_carts/item_quantity",
                          locals: { cart_item: self }
    
  broadcast_replace_to shop_cart,
                          target: "total_price",
                          partial: "shop_carts/total_price",
                          locals: { current_cart: shop_cart }

  end

  after_destroy_commit do
    broadcast_remove_to shop_cart
    broadcast_replace_to shop_cart,
                          target: "cart_count",
                          partial: "shop_carts/item_count",
                          locals: { count: shop_cart.quantity }

  broadcast_replace_to shop_cart,
                          target: "total_price",
                          partial: "shop_carts/total_price",
                          locals: { current_cart: shop_cart }

  end

  def total_price
    quantity.to_i * product.price.to_f
  end
end
