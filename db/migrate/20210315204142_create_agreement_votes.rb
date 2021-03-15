class CreateAgreementVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :agreement_votes do |t|
      t.references :agreement, null: false, foreign_key: true
      t.references :preposal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
