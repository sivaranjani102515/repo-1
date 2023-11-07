# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
    has_many :product_categories
    has_many :products
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_one_attached :image, :dependent => :destroy
end
