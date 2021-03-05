class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.integer :number_card
      t.string :name_bank
      t.string :titular_name
      t.date :expiration_date
      t.string :type

      t.timestamps
    end
  end
end
