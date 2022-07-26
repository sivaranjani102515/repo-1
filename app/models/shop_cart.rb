# == Schema Information
#
# Table name: shop_carts
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_shop_carts_on_token    (token) UNIQUE
#  index_shop_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class ShopCart < ApplicationRecord
    has_secure_token
    has_many :shop_cart_items, :dependent => :destroy
    has_many :products, through: :shop_cart_items

    def quantity
        shop_cart_items.sum(&:quantity)
    end
end
