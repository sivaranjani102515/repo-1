class CreateShopCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_cart_items do |t|
      t.belongs_to :shop_cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
