class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.bigint :number_card
      t.string :name_bank
      t.string :titular_name
      t.date :expiration_date
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
