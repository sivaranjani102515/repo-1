# == Schema Information
#
# Table name: shop_carts
#
#  id                :bigint           not null, primary key
#  status            :string
#  token             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  stripe_payment_id :string
#  user_id           :integer
#
# Indexes
#
#  index_shop_carts_on_token    (token) UNIQUE
#  index_shop_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ShopCart < ApplicationRecord
    has_secure_token
    belongs_to :user
    has_many :shop_cart_items, :dependent => :destroy
    has_many :products, through: :shop_cart_items
    after_save :add_products_to_user, if: :paid_status?

    def quantity
        shop_cart_items.sum(&:quantity)
    end

    private

    def paid_status?
        status == 'succeeded'
    end

    def add_products_to_user
        user.product_ids += shop_cart_items.pluck(:product_id)
        user.save
    end
end
