class ShopCart < ApplicationRecord
    has_secure_token
    has_many :shop_cart_items, dependent: :destroy

    def quantity
        shop_cart_items.sum(&:quantity)
    end
end
