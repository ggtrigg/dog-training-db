class AddDetailsToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :age, :integer
  end
end
