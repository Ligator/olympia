class CreateAgremments < ActiveRecord::Migration[6.1]
  def change
    create_table :agremments do |t|
      t.string :title
      t.text :description
      t.text :state
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
