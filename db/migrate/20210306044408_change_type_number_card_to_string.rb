class ChangeTypeNumberCardToString < ActiveRecord::Migration[6.1]
  def change
    change_column(:cards, :number_card, :string)
  end
end
