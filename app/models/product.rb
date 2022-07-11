# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :integer
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_one_attached :image, :dependent => :destroy
    has_many :product_categories
    has_many :categories, through: :product_categories

    accepts_nested_attributes_for :categories
end
