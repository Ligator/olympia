class AddDeliveryAttributesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :weight, :integer, after: :store_id
    add_column :products, :height, :integer, after: :store_id
    add_column :products, :width, :integer, after: :store_id
    add_column :products, :length, :integer, after: :store_id
    add_column :products, :delivery_cost, :integer, after: :store_id
  end
end
