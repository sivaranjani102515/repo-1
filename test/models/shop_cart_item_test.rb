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
require "test_helper"

class ShopCartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
