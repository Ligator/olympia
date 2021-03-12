class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :body
      t.integer :votes_count
      t.decimal :votes_porcentage
      t.references :users, null: false, foreign_key: true
      t.references :agremments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
