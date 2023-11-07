# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  description       :string
#  name              :string
#  price             :integer
#  slug              :string
#  visible           :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :integer
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

    validates :name, presence: { massage: "Name can't be blank" }
    validates :description, presence: { massage: "Description can't be blank" }
    validates :price, presence: { massage: "Price can't be blank" }
    

    def create_stripe_product
        stripe_product = Stripe::Product.create({name: self.name})
        stripe_price = Stripe::Price.create({
            product: stripe_product.id,
            unit_amount: self.price,
            currency: 'usd',
        })

          update(stripe_product_id: stripe_product.id, stripe_price_id: stripe_price.id)
    end
end
