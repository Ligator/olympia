class AddNewPartnerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :new_partner, :boolean
  end
end
