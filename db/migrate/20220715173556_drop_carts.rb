class DropCarts < ActiveRecord::Migration[7.0]
  def up
    drop_table :carts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
