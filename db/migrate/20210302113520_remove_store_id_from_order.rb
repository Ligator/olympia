class RemoveStoreIdFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :store_id, :integer
  end
end
