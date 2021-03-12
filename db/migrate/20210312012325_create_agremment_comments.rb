class CreateAgremmentComments < ActiveRecord::Migration[6.1]
  def change
    create_table :agremment_comments do |t|
      t.references :agremments, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
