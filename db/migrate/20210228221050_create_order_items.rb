class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.integer :quantity
      t.string :size

      t.timestamps
    end
  end
end
