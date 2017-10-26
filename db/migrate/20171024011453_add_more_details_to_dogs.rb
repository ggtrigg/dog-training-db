class AddMoreDetailsToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :sex, :integer
    add_column :dogs, :desexed, :boolean
  end
end
