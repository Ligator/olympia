class CreateAgremmentVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :agremment_votes do |t|
      t.references :agremments, null: false, foreign_key: true
      t.references :proposals, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
