class CreateShopCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_carts do |t|
      t.string :token

      t.timestamps
    end
    add_index :shop_carts, :token, unique: true
  end
end
