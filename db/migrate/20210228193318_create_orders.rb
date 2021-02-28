class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :user_id
      t.integer :amount_in_cents
      t.string :state, default: "pending"
      t.string :payment_method

      t.timestamps
    end
  end
end
