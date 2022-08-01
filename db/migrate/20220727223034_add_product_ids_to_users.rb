class AddProductIdsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :product_ids, :json, default:[]
  end
end
