# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  description       :string
#  name              :string
#  price             :integer
#  slug              :string
#  visible           :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  stripe_price_id   :string
#  stripe_product_id :string
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#
class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_one_attached :image, :dependent => :destroy
    has_many :product_categories, :dependent => :destroy
    has_many :categories, through: :product_categories

    accepts_nested_attributes_for :categories
    after_create :create_stripe_product

    def create_stripe_product
        product = Stripe::Product.create({name: self.name,})
        price = Stripe::Price.create({
            product: product.id,
            unit_amount: self.price,
            currency: 'usd',
        })

          update(stripe_product_id: product.id, stripe_price_id: price.id)
    end
end
