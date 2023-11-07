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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
